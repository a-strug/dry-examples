### dry-view
Provides a complete, standalone view rendering system
```
bin/console

Dry::View::Tilt.deregister_adapter(:erb)
view = DryView::TvView.new
view.call(model: "Samsung", description: "Cool device").to_s # => "<html>\n  <body>\n    <h1>Samsung</h1>\n<p>Here is detailed description: Cool device</p>\n\n  </body>\n</html>\n"
```
