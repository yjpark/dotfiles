param (
    [string]$name
)

If ($name -eq "core") {
    cd ~/projects/yjpark/dap.core.fsharp
} ElseIf ($name -eq "lib") {
    cd ~/projects/yjpark/dap.lib.fsharp
} ElseIf ($name -eq "gui") {
    cd ~/projects/yjpark/dap.gui.fsharp
} ElseIf ($name -eq "bit") {
    cd ~/projects/pettyfun/Bit.Arbitrage
} Else {
    cd ~/
}
