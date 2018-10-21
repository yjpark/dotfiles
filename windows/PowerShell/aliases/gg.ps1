param (
    [string]$name
)

If ($name -eq "core") {
    cd ~/projects/yjpark/dap.core.fsharp
} ElseIf ($name -eq "build") {
    cd ~/projects/yjpark/dap.build.fsharp
} ElseIf ($name -eq "lib") {
    cd ~/projects/yjpark/dap.lib.fsharp
} ElseIf ($name -eq "gui") {
    cd ~/projects/yjpark/dap.gui.fsharp
} ElseIf ($name -eq "bit") {
    cd ~/projects/pettyfun/Bit.Arbitrage
} ElseIf ($name -eq "clip") {
    cd ~/projects/pettyfun/SuperClip
} ElseIf ($name -eq "log") {
    cd ~/projects/pettyfun/JsonLogViewer
} Else {
    cd ~/
}
