aliases['paket'] = 'mono .paket/paket.exe'

aliases['d.restore'] = 'cb ; dotnet restore'
aliases['d.build'] = 'cb ; dotnet build --no-restore'
aliases['d.build.self'] = 'cb ; dotnet build --no-restore --no-dependencies'
aliases['d.run'] = 'cb ; dotnet run --no-build --no-restore'
aliases['d.watch'] = 'cb ; dotnet watch run --no-restore'
aliases['d.fable'] = 'cb ; dotnet fable yarn-start'
aliases['d.pack.release'] = 'cb ; dotnet pack --configuration Release'

aliases['f'] = 'cb ; fake build'

aliases['f.t'] = 'cb ; fake build -t'
aliases['f.list'] = 'cb ; fake build --list'
aliases['f.prepare'] = 'cb ; fake build -t prepare'
aliases['f.restore'] = 'cb ; fake build -t restore'
aliases['f.build'] = 'cb ; fake build -t build'

aliases['f.fetch'] = 'cb ; fake build -t fetch'
aliases['f.inject'] = 'cb ; fake build -t inject'

aliases['f.dist'] = 'cb ; fake build -t dist'

aliases['f.build-s'] = 'cb ; fake build -t build -s'
aliases['f.pack-s'] = 'cb ; fake build -t pack -s'
aliases['f.inject-s'] = 'cb ; fake build -t inject -s'
aliases['f.push-s'] = 'cb ; fake build -t push -s'
