class Metrolite extends patchosaur.Unit
  @names: ['metrolite']
  setup: (@objectModel) ->
    console.log 'making metrolite unit', @
    @args = @objectModel.get 'unitArgs'
    [deltaT, rest...] = @args
    @objectModel.set numInlets: 1
    @objectModel.set numOutlets: 1
    # make inlets from @call
    @inlets = [@inlet]
    # FIXME: make it take start/stop in inlet
    @ticker = setInterval @tick, deltaT

  stop: =>
    console.log 'stopping metro'
    clearInterval @ticker

  inlet: (arg) =>
    console.log 'metro heard something:', arg
    do @stop if not arg

  tick: =>
    @out 0, true

patchosaur.units.add Metrolite

