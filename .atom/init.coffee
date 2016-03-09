atom.packages.onDidActivatePackage (pack) ->
  if pack.name == 'ex-mode'
    Ex = pack.mainModule.provideEx()
    Ex.registerCommand 'bd', -> atom.workspace.getActivePane().destroyActiveItem()
