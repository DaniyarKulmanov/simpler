# Simpler

**Simpler** is a little web framework written in [Ruby](https://www.ruby-lang.org) language. It's compatible with [Rack](https://rack.github.io) interface and intended to **learn** how web frameworks work in general.

## The application overview

Simpler application is a singleton instance of the `Simpler::Application` class. For convenience it can be obtained by calling `Simpler.application` method. This instance holds all the routes and responds to `call` method which is required by the Rack interface.

#TODO:

1. use https://guides.rubyonrails.org/v3.1.0/layouts_and_rendering.html#using-render
2. watch controller session, check render option for view/controllers