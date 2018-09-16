alias paket-5.172.4='mono ~/.local/share/NuGet/Cache/Paket/5.172.4/paket.exe'

alias d.restore='cb ; dotnet restore'
alias d.build='cb ; dotnet build --no-restore'
alias d.build.self='cb ; dotnet build --no-restore --no-dependencies'
alias d.run='cb ; dotnet run --no-build --no-restore'
alias d.watch='cb ; dotnet watch run --no-restore'
alias d.fable='cb ; dotnet fable yarn-start'
alias d.pack.release='cb ; dotnet pack --configuration Release'

alias f.build='cb ; fake build'
alias f.list='cb ; fake build --list'
alias f.target='cb ; fake build -t'

