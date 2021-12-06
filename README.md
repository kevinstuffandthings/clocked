# Clocked ![Build Status](https://github.com/kevinstuffandthings/clocked/actions/workflows/ruby.yml/badge.svg) [![Gem Version](https://badge.fury.io/rb/clocked.svg)](https://badge.fury.io/rb/clocked)

A simple code timer. One of many. But simple.

## Installation
Add this line to your application's Gemfile:

```ruby
# update with the version of your choice
gem 'clocked'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install clocked
```

## Usage
```ruby
require "clocked"

sw = Clocked::Stopwatch.new("My expensive routine")

sleep 3.2
sw.mark_lap

sleep 1.4
sw.mark_lap("next one")

sleep 0.5
sleep 0.8
sw.mark_lap

puts sw
```

Output:
```
My expensive routine: 5.912148s (Lap 1: 3.201557s, next one: 1.404762s, Lap 3: 1.305776s)
```

# Problems?
Please submit an [issue](https://github.com/kevinstuffandthings/clocked/issues).
We'll figure out how to get you up and running with Clocked as smoothly as possible.
