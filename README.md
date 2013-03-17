# Manywords

You may be playing a word game and be stuck. Use this gem to find all of the possible words that exist with a given word combination. You can also provide a regular expression to filter you search.

## Installation

Add this line to your application's Gemfile:

    gem 'manywords'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install manywords

## Usage

To just find all possible words, run the following:

    $ manywords abcde

To filter your search, run the following:

    $ manywords ^...$

By default, manywords uses the UNIX standard dictionary file, `/usr/share/dict/words`.  If your platform doesn't have this file, or you would like to provide your own, use the `--dictionary` flag.

    $ manywords --dictionary /path/to/dict abcde

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
