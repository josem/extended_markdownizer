#Extended Markdownizer

A simple gem for Rails 3 to render some ActiveRecord text field as Markdown!

Based on [Markdownizer](https://github.com/codegram/markdownizer), by [Txus](https://github.com/txus).

It mixes CodeRay and RDiscount to give you awesome code highlighting :)

Besides that:

* Converts Youtube urls into embedded videos. 
* Converts Vimeo urls into embedded videos. 
* Detects urls and converts into anchors.



##Install

In your Gemfile:

    gem 'extended_markdownizer'

If you want code highlighting, you should run this generator too:

    rails generate extended_markdownizer:install

This will place a extended_markdownizer.css file in your `public/stylesheets` folder.
You will have to require it manually in your layouts, or through `jammit`, or
whatever.

## Usage

In your model, let's say, Post:

    class Post < ActiveRecord::Base
      extended_markdownize! :body
      # In this case we want to treat :body as markdown.
      # You can pass an options hash to the code renderer, such as:
      #
      #   extended_markdownize! :body, :line_numbers => :table
      #
    end

Extended Markdownizer needs an additional field (`:rendered_body`), which you should
generate in a migration. (If the attribute was `:some_other_field`, it would need
`:rendered_some_other_field`!) All these fields should have the type `:text`.

You save your posts with markdown text like this:

    Post.create body: """
      # My H1 title
      Markdown is awesome!
      ## Some H2 title...

      {% code ruby %}
      {% caption 'This caption will become an h5 and also a property of the enclosing div' %}
      {% highlight [1,2,3] %}  <- this will highlight lines 1, 2 and 3 (it accepts a Range as well)

        # All this code will be highlighted properly! :)
        def my_method(*my_args)
          something do
            . . .
          end
        end

      {% endcode %}
    """

And then, in your view you just have to call `<%= raw @post.rendered_body %>` :)

##TODO
* Update specs
* Fix rocco docs

## Copyright
Markdown: Copyright (c) 2011 Codegram. See LICENSE for details.
Extended Markdown: Copyright (c) 2011 José M. Gilgado
