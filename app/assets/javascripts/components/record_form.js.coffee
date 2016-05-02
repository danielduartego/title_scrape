@RecordForm = React.createClass
  getInitialState: ->
    title: ''

  valid: ->
    @state.title

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-group'
      onSubmit: @handleSubmit

      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Amazon url'
          name: 'title'
          value: @state.title
          onChange: @handleChange

      React.DOM.div
        className: 'form-group'
        React.DOM.button
          type: 'submit'
          className: 'btn btn-success'
          'Scrape Title'
