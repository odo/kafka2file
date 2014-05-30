-module(kafka2file).

-behaviour(ductus_callback).

-define(LINEFEED, <<"\n">>).

-export([init/2, handle_messages/3, aggregate_element/1, handle_periodic_aggregate/1]).

-record(state, { topic, file, message_count }).

init(Topic, Filename) ->
    {ok, File} = file:open(Filename, [append]),
    {ok, #state{ topic = Topic, file = File, message_count = 0 }}.

handle_messages(Msgs, _Offset, State = #state{ file = File, message_count = MessageCount}) ->
    [ok = file:write(File, << Msg/binary, ?LINEFEED/binary >>) || Msg <- Msgs],
    NewMessageCount = MessageCount + length(Msgs),
    {ok, State#state{ message_count = NewMessageCount }}.

aggregate_element(State = #state{ message_count = MessageCount }) ->
    {ok, MessageCount, State}.

handle_periodic_aggregate(Counts) ->
    [io:format("Messages in topic ~p\t: ~p\n", [Topic, Count]) || {Topic, Count} <- Counts].
