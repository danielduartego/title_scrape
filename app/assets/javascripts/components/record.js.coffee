@Record = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.title
