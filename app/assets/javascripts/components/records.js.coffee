@Records = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  addRecord: (record) ->
    records = @state.records.slice()
    records.push record
    @setState records: records

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Amazon Title Scrape'

      React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered table-striped'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Amazon Titles'

        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record
