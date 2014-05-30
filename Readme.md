# kafka2file

kafka2file is an erlang applicatin that copies messages from a kafka 0.6 broker into a file.
It mainly servers as an example on how to use [kafka_ductus](https://github.com/odo/kafka_ductus/).

## Installation

```
git clone git@github.com:odo/kafka2file.git
cd kafka2file
```
adapt the config in `config/kafka2file.config`

```
./rebar get-deps com
./bin/ductus reset_to_oldest_offsets kafka2file
```

## Start
`/bin/ductus console kafka2file`

For further details please refer to [kafka_ductus](https://github.com/odo/kafka_ductus/).


