function Invoke-ExperimentalTweaks {
<#
	$MultilineComment = @'
Windows Registry Editor Version 5.00

; KHORVIE TECH
; tcpip tweaks
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
"TcpTimedWaitDelay"=dword:0000001e
"Tcp1323Opts"=dword:00000000
"TcpMaxConnectRetransmissions"=dword:00000001
"DelayedAckFrequency"=dword:00000001
"DelayedAckTicks"=dword:00000001
"MultihopSets"=dword:0000000f

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters]
"IRPStackSize"=dword:00000032
"SizReqBuf"=dword:00004410

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\QoS]
"Do not use NLA"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters]
"NegativeCacheTime"=dword:00000000
"NegativeSOACacheTime"=dword:00000000
"NetFailureCacheTime"=dword:00000000
"EnableAutoDoh"=dword:00000002

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"NonBlockingSendSpecialBuffering"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters]
"TCPNoDelay"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched]
"NonBestEffortLimit"=dword:00000000

; DWM Schedule MASTER VALUES
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM\Schedule]
"WindowedGsyncGeforceFlag"=dword:00000000
"FrameRateMin"=dword:ffffffff
"IgnoreDisplayChangeDuration"=dword:00000000
"LingerInterval"=dword:00000000
"LicenseInterval"=dword:00000000
"RestrictedNvcplUIMode"=dword:00000000
"DisableSpecificPopups"=dword:00000001
"DisableExpirationPopups"=dword:00000001
"EnableForceIgpuDgpuFromUI"=dword:00000001
"HideXGpuTrayIcon"=dword:00000001
"ShowTrayIcon"=dword:00000000
"HideBalloonNotification"=dword:00000001
"PerformanceState"=dword:00000000
"Gc6State"=dword:00000000
"FrameDisplayBaseNegOffsetNS"=dword:ffe17b80
"FrameDisplayResDivValue"=dword:00000001
"IgnoreNodeLocked"=dword:00000001
"IgnoreSP"=dword:00000001
"DontAskAgain"=dword:00000001

; Kernel New Kizzimo
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"KiClockTimerPerCpu"=dword:00000001
"KiClockTimerHighLatency"=dword:00000000
"KiClockTimerAlwaysOnPresent"=dword:00000001
"ClockTimerPerCpu"=dword:00000001
"ClockTimerHighLatency"=dword:00000000
"ClockTimerAlwaysOnPresent"=dword:00000001

; smooth scrolling
[HKEY_CURRENT_USER\Control Panel\Desktop]
"SmoothScroll"=dword:00000000

; fast user switching
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"HideFastUserSwitching"=dword:00000001

; dont tolerate high dpcisr
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"ExitLatency"=dword:00000001
"ExitLatencyCheckEnabled"=dword:00000001
"Latency"=dword:00000001
"LatencyToleranceDefault"=dword:00000001
"LatencyToleranceFSVP"=dword:00000001
"LatencyTolerancePerfOverride"=dword:00000001
"LatencyToleranceScreenOffIR"=dword:00000001
"LatencyToleranceVSyncEnabled"=dword:00000001
"RtlCapabilityCheckLatency"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power]
"DefaultD3TransitionLatencyActivelyUsed"=dword:00000001
"DefaultD3TransitionLatencyIdleLongTime"=dword:00000001
"DefaultD3TransitionLatencyIdleMonitorOff"=dword:00000001
"DefaultD3TransitionLatencyIdleNoContext"=dword:00000001
"DefaultD3TransitionLatencyIdleShortTime"=dword:00000001
"DefaultD3TransitionLatencyIdleVeryLongTime"=dword:00000001
"DefaultLatencyToleranceIdle0"=dword:00000001
"DefaultLatencyToleranceIdle0MonitorOff"=dword:00000001
"DefaultLatencyToleranceIdle1"=dword:00000001
"DefaultLatencyToleranceIdle1MonitorOff"=dword:00000001
"DefaultLatencyToleranceMemory"=dword:00000001
"DefaultLatencyToleranceNoContext"=dword:00000001
"DefaultLatencyToleranceNoContextMonitorOff"=dword:00000001
"DefaultLatencyToleranceOther"=dword:00000001
"DefaultLatencyToleranceTimerPeriod"=dword:00000001
"DefaultMemoryRefreshLatencyToleranceActivelyUsed"=dword:00000001
"DefaultMemoryRefreshLatencyToleranceMonitorOff"=dword:00000001
"DefaultMemoryRefreshLatencyToleranceNoContext"=dword:00000001
"Latency"=dword:00000001
"MaxIAverageGraphicsLatencyInOneBucket"=dword:00000001
"MiracastPerfTrackGraphicsLatency"=dword:00000001
"MonitorLatencyTolerance"=dword:00000001
"MonitorRefreshLatencyTolerance"=dword:00000001
"TransitionLatency"=dword:00000001

; Display
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\ModernSleep]
"AdaptiveRefreshRate"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"VideoIdleTimeout"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers]
"PowerSavingModeEnabled"=dword:00000000
"PanelSelfRefresh"=dword:00000000
"ForceOffScreenTimeout"=dword:00000000

; GPU
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler]
"EnableFrameBufferCompression"=dword:00000000
"EnableGpuBoost"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv]
"Start"=dword:00000004

; Network
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001]
"PnPCapabilities"=dword:00000024

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002]
"PnPCapabilities"=dword:00000024

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
"DisablePowerManagement"=dword:00000001

; System
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"EnergySaverStatus"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"DynamicThrottlePolicy"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"EcoMode"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel]
"GlobalTimerResolutionRequests"=dword:00000001

; USB Regs
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB\Parameters]
"DisableSelectiveSuspend"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters]
"SelectiveSuspendEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters]
"EnhancedPowerManagementEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters]
"DisableLegacyUSBSupport"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\usbaudio\Parameters]
"PowerSettings"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters]
"DeviceIdleEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters]
"SelectiveSuspendEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidUsb\Parameters]
"DisableWakeFromSuspend"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB\Parameters]
"ForceHCResetOnResume"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB]
"DisableSelectiveSuspend"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters]
"DisableSelectiveSuspend"=dword:00000001

; Network
; afd tweaks
; ignoreOrderlynPushBit
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"IgnoreOrderlyRelease"=dword:00000001
"IgnorePushBitOnReceives"=dword:00000001

; Fast Send Copy
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"FastSendDatagramThreshold"=dword:00000400
"FastCopyReceiveThreshold"=dword:00000400

; DynamicSendBufferDisable
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DynamicSendBufferDisable"=dword:00000001

; DoNotHoldNICBuffers
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DoNotHoldNICBuffers"=dword:00000001

; DisableDirectAcceptEx
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DisableDirectAcceptEx"=dword:00000001

; DisableChainedReceive
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DisableChainedReceive"=dword:00000001

; DisableAddressSharing
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DisableAddressSharing"=dword:00000001

; DefaultSendReceive
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DefaultReceiveWindow"=dword:00100000
"DefaultSendWindow"=dword:00100000

; DefaultSendReceive2
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"DefaultReceiveWindow"=dword:00040000
"DefaultSendWindow"=dword:00040000

; BufferAlignment
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters]
"BufferAlignment"=dword:00000001

; pwrSaving
[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0002]
"EnableDynamicPowerGating"=dword:00000000
"EnableSavePowerNow"=dword:00000000
"NicAutoPowerSaver"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games]
"Latency Sensitive"="True"

[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NDIS\Parameters]
"EnableNicAutoPowerSaverInSleepStudy"=dword:00000000

;Security
; disable allow pc to be discoverable
[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Network]
"NewNetworkWindowOff"=dword:00000001

; disableRDP
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]
"fDenyTSConnections"=dword:00000001

; protocol methods
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0]
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0]
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0]
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1]
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server]
"DisabledByDefault"=dword:00000001
"Enabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2]
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client]
"DisabledByDefault"=dword:00000000
"Enabled"=dword:00000001
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server]
"DisabledByDefault"=dword:00000000
"Enabled"=dword:00000001

; RestrictNTLM
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
"LmCompatibilityLevel"=dword:00000005

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0]
"RestrictSendingNTLMTraffic"=dword:00000002

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters]
"EnableLMHash"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient]
"DisableMultihomeDNSRegistration"=dword:00000001
"DisableParallelNameResolution"=dword:00000001
"DisableSmartNameResolution"=dword:00000001
"EnableMulticast"=dword:00000000

; security
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters]
"DisableParallelAandAAAA"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters]
"SMB1"=dword:00000000

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters\Interfaces]
"NetBIOSOptions"=dword:00000002

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]
"EnableLMHOSTS"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
"EnableICMPRedirect"=dword:00000000

; Regtweaks
; serialize timer
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"SerializeTimerExpiration"=dword:00000001

; mouclass
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters]
"MouseDataQueueSize"=dword:0000001e

; kbdclass
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters]
"KeyboardDataQueueSize"=dword:0000001e

; HoverTime
[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseHoverTime"="10"

; disableStartupDelay
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize]
"StartupDelayInMSec"=dword:00000000

; disableAutoRun
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000FF

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000FF

; WcmSvc
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local]
"WCMPresent"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy]
"fDisablePowerManagement"=dword:00000001

; privacy
; p2p
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Peernet]
"Disabled"=dword:00000000

; ntusb
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client]
"fEnableUsbBlockDeviceBySetupClass"
"fEnableUsbNoAckIsochWriteToDevice"
"fEnableUsbSelectDeviceByInterface"

; handwriteDataShare
; HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC
; "PreventHandwritingDataSharing"=dword:00000000

; explorer
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoLowDiskSpaceChecks"=dword:00000001
"NoResolveSearch"=dword:00000001
"NoResolveTrack"=dword:00000001
"TurnOffSPIAnimations"=dword:00000001

; appCompat
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]
"AITEnable"=dword:00000000
"DisableInventory"=dword:00000001
"DisableUAR"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\AppCompat]
"DisablePCA"=dword:00000001




; ARKHAM
; DirectX Tweaks
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX]
"D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE"=dword:00000001
"D3D12_ENABLE_RUNTIME_DRIVER_OPTIMIZATIONS"=dword:00000001
"D3D12_RESOURCE_ALIGNMENT"=dword:00000001
"D3D11_MULTITHREADED"=dword:00000001
"D3D12_MULTITHREADED"=dword:00000001
"D3D11_DEFERRED_CONTEXTS"=dword:00000001
"D3D12_DEFERRED_CONTEXTS"=dword:00000001
"D3D11_ALLOW_TILING"=dword:00000001
"D3D11_ENABLE_DYNAMIC_CODEGEN"=dword:00000001
"D3D12_ALLOW_TILING"=dword:00000001
"D3D12_CPU_PAGE_TABLE_ENABLED"=dword:00000001
"D3D12_HEAP_SERIALIZATION_ENABLED"=dword:00000001
"D3D12_MAP_HEAP_ALLOCATIONS"=dword:00000001
"D3D12_RESIDENCY_MANAGEMENT_ENABLED"=dword:00000001


; General DirectX Tweaks (DXGKrnl)
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DXGKrnl]
"CreateGdiPrimaryOnSlaveGPU"=dword:00000001
"DriverSupportsCddDwmInterop"=dword:00000001
"DxgkCddSyncDxAccess"=dword:00000001
"DxgkCddSyncGPUAccess"=dword:00000001
"DxgkCddWaitForVerticalBlankEvent"=dword:00000001
"DxgkCreateSwapChain"=dword:00000001
"DxgkFreeGpuVirtualAddress"=dword:00000001
"DxgkOpenSwapChain"=dword:00000001
"DxgkShareSwapChainObject"=dword:00000001
"DxgkWaitForVerticalBlankEvent"=dword:00000001
"DxgkWaitForVerticalBlankEvent2"=dword:00000001
"SwapChainBackBuffer"=dword:00000001
"TdrResetFromTimeoutAsync"=dword:00000001

; NVMe Tweaks (stornvme)
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters]
"StorNVMeAllowZeroLatency"=dword:00000001
"QueueDepth"=dword:00000040
"NvmeMaxReadSplit"=dword:00000004
"NvmeMaxWriteSplit"=dword:00000004
"ForceFlush"=dword:00000001
"ImmediateData"=dword:00000001
"MaxSegmentsPerCommand"=dword:00000100
"MaxOutstandingCmds"=dword:00000100
"ForceEagerWrites"=dword:00000001
"MaxQueuedCommands"=dword:00000100
"MaxOutstandingIORequests"=dword:00000100
"NumberOfRequests"=dword:000005dc
"IoSubmissionQueueCount"=dword:00000003
"IoQueueDepth"=dword:00000040
"HostMemoryBufferBytes"=dword:000005dc
"ArbitrationBurst"=dword:00000100


; NVMe Tweaks (StorNVMe\Parameters\Device)
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device]
"StorNVMeAllowZeroLatency"=dword:00000001
"QueueDepth"=dword:00000040
"NvmeMaxReadSplit"=dword:00000004
"NvmeMaxWriteSplit"=dword:00000004
"ForceFlush"=dword:00000001
"ImmediateData"=dword:00000001
"MaxSegmentsPerCommand"=dword:00000100
"MaxOutstandingCmds"=dword:00000100
"ForceEagerWrites"=dword:00000001
"MaxQueuedCommands"=dword:00000100
"MaxOutstandingIORequests"=dword:00000100
"NumberOfRequests"=dword:000005dc
"IoSubmissionQueueCount"=dword:00000003
"IoQueueDepth"=dword:00000040
"HostMemoryBufferBytes"=dword:000005dc
"ArbitrationBurst"=dword:00000100


; DPC Kernel Tweaks
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"DpcWatchdogProfileOffset"=dword:00000000
"DpcTimeout"=dword:00000000
"IdealDpcRate"=dword:00000001
"MaximumDpcQueueDepth"=dword:00000001
"MinimumDpcRate"=dword:00000001
"DpcWatchdogPeriod"=dword:00000000
"MaxDynamicTickDuration"=dword:0000000a
"MaximumSharedReadyQueueSize"=dword:00000080
"BufferSize"=dword:00000020
"IoQueueWorkItem"=dword:00000020
"IoQueueWorkItemToNode"=dword:00000020
"IoQueueWorkItemEx"=dword:00000020
"IoQueueThreadIrp"=dword:00000020
"ExTryQueueWorkItem"=dword:00000020
"ExQueueWorkItem"=dword:00000020
"IoEnqueueIrp"=dword:00000020
"XMMIZeroingEnable"=dword:00000000
"UseNormalStack"=dword:00000001
"UseNewEaBuffering"=dword:00000001
"StackSubSystemStackSize"=dword:00010000


; Distribute Timers
; [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
; "DistributeTimers"=dword:00000001

; Disable NTFS tunnelling
; [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
; "MaximumTunnelEntries"=dword:00000000

; Max Pending Interrupts
; Founder by kizzimo

; CPU Performance Tuning
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]
"CPU_MAX_PENDING_INTERRUPTS"="0"  ; Minimizes the number of interrupts waiting, reducing latency.
"CPU_MAX_PENDING_IO"="0"           ; Keeps I/O processing instant, minimizing wait times.
"CPU_IDLE_POLICY"="0"              ; Prevents CPU from idling to maintain maximum performance.
"CPU_BOOST_POLICY"="2"             ; Always allows the CPU to boost for better performance.
"CPU_MAX_FREQUENCY"="100"          ; Allows the CPU to reach maximum frequency.
"CPU_INTERRUPT_BALANCE_POLICY"="1" ; Ensures interrupts are balanced across all CPU cores.
"MKL_DEBUG_CPU_TYPE"="10"

; I/O Performance Tuning
"IO_COMPLETION_POLICY"="0"         ; Immediate completion of I/O requests to minimize latency.
"IO_REQUEST_LIMIT"="1024"          ; Increases the number of simultaneous I/O requests.
"DISK_MAX_PENDING_IO"="0"          ; No pending I/O for disk operations, reducing read/write latency.
"IO_PRIORITY"="0"                  ; Maximize I/O priority for all operations to minimize bottlenecks.
"DISK_MAX_PENDING_INTERRUPTS"="0"
"IO_MAX_PENDING_INTERRUPTS"="0"

; Power Management and Performance
"POWER_THROTTLE_POLICY"="0"        ; Disables power throttling, ensuring high performance at all times.
"POWER_IDLE_TIMEOUT"="0"           ; Disables idle timeout to maintain continuous high performance.
"CPU_POWER_POLICY"="1"             ; Enforces high-performance power policy, disabling all power-saving features.
"DISABLE_DYNAMIC_TICK"="yes"

; Memory and Latency Tuning
"MEMORY_MAX_ALLOCATION"="0"     ; Increase memory allocation to allow more data in memory for faster access.
"MEMORY_LATENCY_POLICY"="0"        ; Minimizes memory latency, optimizing for faster memory access.
"MEMORY_PREFETCH_POLICY"="2"       ; Enables memory prefetch to speed up data access in memory.
"MEMORY_MAX_PENDING_INTERRUPTS"="0"
"DWM_MAX_PENDING_INTERRUPTS"="0"
"DWM_COMPOSITOR_MAX_PENDING_INTERRUPTS"="0"

; Network and Connectivity Tuning
"NETWORK_BUFFER_SIZE"="512"       ; Increases network buffer size for faster throughput.
"NETWORK_INTERRUPT_COALESCING"="0" ; Disables interrupt coalescing for lower network latency.
"NETWORK_MAX_PENDING_INTERRUPTS"="0"

; Miscellaneous Performance Tuning
"TIMER_RESOLUTION"="0"             ; Sets the smallest possible timer resolution for the highest responsiveness.
"THREAD_SCHEDULER_POLICY"="0"      ; Prioritizes immediate thread scheduling to reduce latency.
"GPU_MAX_PENDING_INTERRUPTS"="0"   ; Minimizes GPU interrupts for faster rendering.

; Network Adapter Performance Tuning
"NETWORK_ADAPTER_PENDING_INTERRUPTS"="0"        ; Ensures no pending interrupts for network devices.
"NETWORK_ADAPTER_MAX_PENDING_IO"="0"            ; Ensures instant I/O processing for network operations.
"NETWORK_ADAPTER_INTERRUPT_MODERATION"="0"      ; Disables interrupt moderation for lower network latency.
"NETWORK_ADAPTER_MAX_PENDING_INTERRUPTS"="0"

; Storage Device (HDD/SSD) Performance Tuning
"STORAGE_DEVICE_PENDING_INTERRUPTS"="0"         ; Ensures no pending interrupts for storage devices.
"STORAGE_DEVICE_MAX_PENDING_IO"="0"             ; Ensures storage I/O operations are processed immediately.
"STORAGE_DEVICE_COMPLETION_POLICY"="0"          ; Forces immediate completion of storage I/O tasks.
"STORAGE_MAX_PENDING_INTERRUPTS"="0"
"STORAGE_DEVICE_MAX_PENDING_INTERRUPTS"="0" 

; USB Device Performance Tuning
"USB_DEVICE_PENDING_INTERRUPTS"="0"             ; No pending interrupts for USB devices.
"USB_DEVICE_MAX_PENDING_IO"="0"                 ; Processes USB I/O instantly, reducing latency.
"USB_MAX_PENDING_INTERRUPTS"="0"
"USB_DEVICE_MAX_PENDING_INTERRUPTS"="0" 

; PCIe Device Performance Tuning
"PCIE_DEVICE_PENDING_INTERRUPTS"="0"            ; No pending interrupts for PCIe devices.
"PCIE_DEVICE_MAX_PENDING_IO"="0"                ; Ensures PCIe I/O operations are processed immediately.
"PCIE_MAX_PENDING_INTERRUPTS"="0"
"PCIE_DEVICE_MAX_PENDING_INTERRUPTS"="0"

; GPU Performance Tuning
"GPU_PENDING_INTERRUPTS"="0"                    ; Reduces GPU interrupt queue to zero for immediate processing.
"GPU_MAX_PENDING_COMPUTE"="0"                   ; Ensures compute operations are processed without delay.
"GPU_MAX_PENDING_RENDER"="0"                    ; Forces immediate rendering tasks processing.

; Audio Device Performance Tuning
"AUDIO_DEVICE_PENDING_INTERRUPTS"="0"           ; Ensures no pending interrupts for sound cards.
"AUDIO_DEVICE_BUFFER_SIZE"="512"                ; Keeps audio buffer size low to reduce latency in sound processing.
"AUDIO_MAX_PENDING_INTERRUPTS"="0"
"AUDIO_DEVICE_MAX_PENDING_INTERRUPTS"="0" 

; General Device Tuning
"DEVICE_PENDING_INTERRUPTS"="0"                 ; Generic setting to ensure no pending interrupts for all devices.
"DEVICE_MAX_PENDING_IO"="0"                     ; Ensures immediate I/O operations across all devices.
"DEVICE_COMPLETION_POLICY"="0"                  ; Forces devices to complete tasks instantly.
"DEVICE_MAX_PENDING_INTERRUPTS"="0"

; Disable Event Processor
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"EventProcessorEnabled"=dword:00000000

; Disable InterruptSteering
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"InterruptSteeringDisabled"=dword:00000001

; MMCSS ENABLE
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MMCSS]
"Start"=dword:00000002

; DWMFlipPresent
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM]
"FrameLatency"=dword:00000002

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM]
"ForceDirectDrawSync"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM]
"MaxQueuedPresentBuffers"=dword:00000001

; SplitLargeCaches
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"SplitLargeCaches"=dword:00000001

; Apply Thread DPC
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"ThreadDpcEnable"=dword:00000000




; HAKANFLY

; Base and OverTarget Priorities
; Founded and Created by Kizzimo 
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0003]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0002]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0001]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0000]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{fe8f1572-c67a-48c0-bbac-0b5c6d66cafb}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f8ecafa6-66d1-41a5-899b-66585d7216b7}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f75a86c0-10d8-4c3a-b233-ed60e4cdfaac}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f3586baf-b5aa-49b5-8d6c-0569284c639f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f2e7dd72-6468-4e36-b6f1-6488f42c1b52}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f048e777-b971-404b-bd9c-3802613495c2}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f01a9d53-3ff6-48d2-9f97-c8a7004be10c}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{eec5ad98-8080-425f-922a-dabf3de3f69a}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e6f1aa1c-7f3b-4473-b2e8-c97d8ac71d53}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e55fa6f9-128c-4d04-abab-630c74b1453a}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e2f84ce7-8efa-411c-aa69-97454ca4cb57}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e0cbf06c-cd8b-4647-bb8a-263b43f0f974}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d94ee5d8-d189-4994-83d2-f68d7d41b0e6}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d546500a-2aeb-45f6-9482-f4b1799c3177}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d48179be-ec20-11d1-b6b8-00c04fa372a7}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d421b08e-6d16-41ca-9c4d-9147e5ac98e0}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d02bc3da-0c8e-4945-9bd5-f1883c226c8c}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{ce5939ae-ebde-11d0-b181-0000f8753ec4}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{cdcf0939-b75b-4630-bf76-80f7ba655884}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{cc342e67-bd5b-4dd2-bb7b-bf23cf9f2a0e}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{ca3e7ab9-b4c3-4ae6-8251-579ef933890f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{c30ecea0-11ef-4ef9-b02e-6af81e6e65c0}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{c166523c-fe0c-4a94-a586-f1a80cfbbf3e}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{c06ff265-ae09-48f0-812c-16753d7cba83}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{bbbe8734-08fa-4966-b6a6-4e5ad010cdd7}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{b86dff51-a31e-4bac-b3cf-e8cfe75c9fc2}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{b2728d24-ac56-42db-9e02-8edaf5db652f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{b1d1a169-c54f-4379-81db-bee7d88d7454}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a73c93f1-9727-4d1d-ace1-0e333ba4e7db}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a3e32dba-ba89-4f17-8386-2d0127fbd4cc}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a0a701c0-a511-42ff-aa6c-06dc0395576f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a0a588a4-c46f-4b37-b7ea-c82fe89870c6}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{9da2b80f-f89f-4a49-a5c2-511b085b9e8a}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{8ecc055d-047f-11d1-a537-0000f8753ed1}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{89786ff1-9c12-402f-9c9e-17753c7f4375}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{88bae032-5a81-49f0-bc3d-a4ff138216d6}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{88a1c342-4539-11d3-b88d-00c04fad5171}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{87ef9ad1-8f70-49ee-b215-ab1fcadcbe3c}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{8503c911-a6c7-4919-8f79-5028f5866b0c}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{7ebefbc0-3200-11d2-b4c2-00a0c9697d07}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{745a17a0-74d3-11d0-b6fe-00a0c90f57da}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{72631e54-78a4-11d0-bcf7-00aa00b7b32a}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{71aa14f8-6fad-4622-ad77-92bb9d7e6947}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6fae73b7-b735-4b50-a0da-0dc2484b1f1a}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6d807884-7d21-11cf-801c-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc5-810f-11d0-bec7-08002be2092f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc1-810f-11d0-bec7-08002be2092f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6a0a8e78-bba6-4fc4-a709-1e33cd09d67e}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{62f9c741-b25a-46ce-b54c-9bccce08b6f2}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5d1b9aaa-01e2-46af-849f-272b3f324c46}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5c4c3332-344d-483c-8739-259e934c9cc8}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5989fce8-9cd0-467d-8a6a-5419e31529d4}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5630831c-06c9-4856-b327-f5d32586e060}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53d29ef7-377c-4d14-864b-eb3a85769359}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53ccb149-e543-4c84-b6e0-bce4f6b7e806}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53b3cf03-8f5a-4788-91b6-d19ed9fcccbf}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53966cb1-4d46-4166-bf23-c522403cd495}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53487c23-680f-4585-acc3-1f10d6777e82}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{533c5b84-ec70-11d2-9505-00c04f79deaf}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5175d334-c371-4806-b3ba-71fd53c9258d}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5099944a-f6b9-4057-a056-8c550228544c}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{50906cb8-ba12-11d1-bf5d-0000f805f530}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{50127dc3-0f36-415e-a6cc-4cb3be910b65}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e97e-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e97b-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e978-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e977-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e975-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e974-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e973-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e971-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e970-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96e-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96d-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96a-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e966-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e965-e325-11ce-bfc1-08002be10318}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{49ce6ac8-6f86-11d2-b1e5-0080c72e74a2}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{48d3ebc4-4cf8-48ff-b869-9c68ad42eb9f}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{48721b56-6795-11d2-b1a8-0080c72e74a2}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4658ee7e-f050-11d1-b6bd-00c04fa372a7}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{43675d81-502a-4a82-9f84-b75f418c5dea}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{3e3f0674-c83c-4558-bb26-9820e1eba5c5}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{36fc9e60-c465-11cf-8056-444553540000}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{2db15374-706e-4131-a0c7-d7c78eb0289a}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{268c95a1-edfe-11d3-95c3-0010dc4050a5}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{25dbce51-6c8f-4a72-8a6d-b54c2b4fc835}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{14b62f50-3f15-11dd-ae16-0800200c9a66}]
"BasePriority"=dword:000000c8

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{1264760f-a5c8-4bfe-b314-d56a7b44a362}]
"BasePriority"=dword:000000c8



[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0003]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0002]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0001]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Video\{33123269-1807-11EF-B26D-806E6F6E6963}\0000]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{fe8f1572-c67a-48c0-bbac-0b5c6d66cafb}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f8ecafa6-66d1-41a5-899b-66585d7216b7}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f75a86c0-10d8-4c3a-b233-ed60e4cdfaac}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f3586baf-b5aa-49b5-8d6c-0569284c639f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f2e7dd72-6468-4e36-b6f1-6488f42c1b52}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f048e777-b971-404b-bd9c-3802613495c2}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{f01a9d53-3ff6-48d2-9f97-c8a7004be10c}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{eec5ad98-8080-425f-922a-dabf3de3f69a}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e6f1aa1c-7f3b-4473-b2e8-c97d8ac71d53}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e55fa6f9-128c-4d04-abab-630c74b1453a}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e2f84ce7-8efa-411c-aa69-97454ca4cb57}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{e0cbf06c-cd8b-4647-bb8a-263b43f0f974}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d94ee5d8-d189-4994-83d2-f68d7d41b0e6}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d546500a-2aeb-45f6-9482-f4b1799c3177}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d48179be-ec20-11d1-b6b8-00c04fa372a7}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d421b08e-6d16-41ca-9c4d-9147e5ac98e0}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{d02bc3da-0c8e-4945-9bd5-f1883c226c8c}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{ce5939ae-ebde-11d0-b181-0000f8753ec4}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{cdcf0939-b75b-4630-bf76-80f7ba655884}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{cc342e67-bd5b-4dd2-bb7b-bf23cf9f2a0e}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{ca3e7ab9-b4c3-4ae6-8251-579ef933890f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{c30ecea0-11ef-4ef9-b02e-6af81e6e65c0}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{c166523c-fe0c-4a94-a586-f1a80cfbbf3e}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{c06ff265-ae09-48f0-812c-16753d7cba83}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{bbbe8734-08fa-4966-b6a6-4e5ad010cdd7}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{b86dff51-a31e-4bac-b3cf-e8cfe75c9fc2}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{b2728d24-ac56-42db-9e02-8edaf5db652f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{b1d1a169-c54f-4379-81db-bee7d88d7454}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a73c93f1-9727-4d1d-ace1-0e333ba4e7db}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a3e32dba-ba89-4f17-8386-2d0127fbd4cc}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a0a701c0-a511-42ff-aa6c-06dc0395576f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{a0a588a4-c46f-4b37-b7ea-c82fe89870c6}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{9da2b80f-f89f-4a49-a5c2-511b085b9e8a}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{8ecc055d-047f-11d1-a537-0000f8753ed1}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{89786ff1-9c12-402f-9c9e-17753c7f4375}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{88bae032-5a81-49f0-bc3d-a4ff138216d6}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{88a1c342-4539-11d3-b88d-00c04fad5171}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{87ef9ad1-8f70-49ee-b215-ab1fcadcbe3c}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{8503c911-a6c7-4919-8f79-5028f5866b0c}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{7ebefbc0-3200-11d2-b4c2-00a0c9697d07}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{745a17a0-74d3-11d0-b6fe-00a0c90f57da}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{72631e54-78a4-11d0-bcf7-00aa00b7b32a}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{71aa14f8-6fad-4622-ad77-92bb9d7e6947}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6fae73b7-b735-4b50-a0da-0dc2484b1f1a}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6d807884-7d21-11cf-801c-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc5-810f-11d0-bec7-08002be2092f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc1-810f-11d0-bec7-08002be2092f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6a0a8e78-bba6-4fc4-a709-1e33cd09d67e}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{62f9c741-b25a-46ce-b54c-9bccce08b6f2}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5d1b9aaa-01e2-46af-849f-272b3f324c46}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5c4c3332-344d-483c-8739-259e934c9cc8}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5989fce8-9cd0-467d-8a6a-5419e31529d4}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5630831c-06c9-4856-b327-f5d32586e060}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53d29ef7-377c-4d14-864b-eb3a85769359}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53ccb149-e543-4c84-b6e0-bce4f6b7e806}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53b3cf03-8f5a-4788-91b6-d19ed9fcccbf}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53966cb1-4d46-4166-bf23-c522403cd495}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{53487c23-680f-4585-acc3-1f10d6777e82}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{533c5b84-ec70-11d2-9505-00c04f79deaf}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5175d334-c371-4806-b3ba-71fd53c9258d}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{5099944a-f6b9-4057-a056-8c550228544c}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{50906cb8-ba12-11d1-bf5d-0000f805f530}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{50127dc3-0f36-415e-a6cc-4cb3be910b65}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e97e-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e97b-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e978-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e977-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e975-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e974-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e973-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e971-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e970-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96e-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96d-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96a-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e966-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e965-e325-11ce-bfc1-08002be10318}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{49ce6ac8-6f86-11d2-b1e5-0080c72e74a2}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{48d3ebc4-4cf8-48ff-b869-9c68ad42eb9f}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{48721b56-6795-11d2-b1a8-0080c72e74a2}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4658ee7e-f050-11d1-b6bd-00c04fa372a7}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{43675d81-502a-4a82-9f84-b75f418c5dea}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{3e3f0674-c83c-4558-bb26-9820e1eba5c5}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{36fc9e60-c465-11cf-8056-444553540000}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{2db15374-706e-4131-a0c7-d7c78eb0289a}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{268c95a1-edfe-11d3-95c3-0010dc4050a5}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{25dbce51-6c8f-4a72-8a6d-b54c2b4fc835}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{14b62f50-3f15-11dd-ae16-0800200c9a66}]
"OverTargetPriority"=dword:00000050

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{1264760f-a5c8-4bfe-b314-d56a7b44a362}]
"OverTargetPriority"=dword:00000050

; Advanced DWM Tweaks
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions]
"CpuPriorityClass"=dword:00000004
"IoPriority"=dword:00000003

; FlipPresent
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM]
"ForceDirectDrawSync"=dword:00000000
"FrameLatency"=dword:00000002
"MaxQueuedPresentBuffers"=dword:00000001

; Adjustablesd - jdallmann
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM]
"DDisplayTestMode"=dword:00000000
"DebugFailFast"=dword:00000000
"DisableDeviceBitmaps"=dword:00000001
"DisableHologramCompositor"=dword:00000001
"DisableLockingMemory"=dword:00000001
"DisableProjectedShadowsRendering"=dword:00000001
"DisableProjectedShadows"=dword:00000001
"DisallowNonDrawListRendering"=dword:00000001
"EnableCpuClipping"=dword:00000001
"EnableRenderPathTestMode"=dword:00000000
"FlattenVirtualSurfaceEffectInput"=dword:00000001
"InkGPUAccelOverrideVendorWhitelist"=dword:00000001
"InteractionOutputPredictionDisabled"=dword:00000001
"MPCInputRouterWaitForDebugger"=dword:00000000
"OneCoreNoDWMRawGameController"=dword:00000000
"ResampleInLinearSpace"=dword:00000001
"SDRBoostPercentOverride"=dword:00000001
"SuperWetEnabled"=dword:00000001

; ImmediateRender - Kizzimo
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM]
"AnimationAttributionEnabled"=dword:00000000
"AnimationsShiftKey"=dword:00000000
"DisableAdvancedDirectFlip"=dword:00000001
"DisableDrawListCaching"=dword:00000001
"EnableCommonSuperSets"=dword:00000001
"EnableDesktopOverlays"=dword:00000000
"EnableEffectCaching"=dword:00000001
"EnableFrontBufferRenderChecks"=dword:00000000
"EnableMegaRects"=dword:00000001
"EnablePrimitiveReordering"=dword:00000000
"EnableResizeOptimization"=dword:00000001
"HighColor"=dword:00000000
"MaxD3DFeatureLevel"=dword:00000000
"OverlayQualifyCount"=dword:00000000
"OverlayDisqualifyCount"=dword:00000000
"ParallelModePolicy"=dword:00000001
"ResampleModeOverride"=dword:00000001
"RenderThreadWatchdogTimeoutMilliseconds"=dword:00000000
"ResizeTimeoutGdi"=dword:00000000
"ResizeTimeoutModern"=dword:00000000
"UseHWDrawListEntriesOnWARP"=dword:00000001

; CSRSS Tweaks
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions]
"CpuPriorityClass"=dword:00000004
"IoPriority"=dword:00000003

; D3D11 - D3D12 Tweaks
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX]
"D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE"=dword:00000001
"D3D12_ENABLE_RUNTIME_DRIVER_OPTIMIZATIONS"=dword:00000001
"D3D12_RESOURCE_ALIGNMENT"=dword:00000001
"D3D11_MULTITHREADED"=dword:00000001
"D3D12_MULTITHREADED"=dword:00000001
"D3D11_DEFERRED_CONTEXTS"=dword:00000001
"D3D12_DEFERRED_CONTEXTS"=dword:00000001
"D3D11_ALLOW_TILING"=dword:00000001
"D3D11_ENABLE_DYNAMIC_CODEGEN"=dword:00000001
"D3D12_ALLOW_TILING"=dword:00000001
"D3D12_CPU_PAGE_TABLE_ENABLED"=dword:00000001
"D3D12_HEAP_SERIALIZATION_ENABLED"=dword:00000001
"D3D12_MAP_HEAP_ALLOCATIONS"=dword:00000001
"D3D12_RESIDENCY_MANAGEMENT_ENABLED"=dword:00000001

; DirectX Driver DXGKrnl Advanced Tweaks (2)
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DXGKrnl]
"CreateGdiPrimaryOnSlaveGPU"=dword:00000001
"DriverSupportsCddDwmInterop"=dword:00000001
"DxgkCddSyncDxAccess"=dword:00000001
"DxgkCddSyncGPUAccess"=dword:00000001
"DxgkCddWaitForVerticalBlankEvent"=dword:00000001
"DxgkCreateSwapChain"=dword:00000001
"DxgkFreeGpuVirtualAddress"=dword:00000001
"DxgkOpenSwapChain"=dword:00000001
"DxgkShareSwapChainObject"=dword:00000001
"DxgkWaitForVerticalBlankEvent"=dword:00000001
"DxgkWaitForVerticalBlankEvent2"=dword:00000001
"SwapChainBackBuffer"=dword:00000001
"TdrResetFromTimeoutAsync"=dword:00000001

; Priority Control Tweaks
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"AdjustDpcThreshold"=dword:00000320
"DeepIoCoalescingEnabled"=dword:00000001
"IdealDpcRate"=dword:00000320
"ForegroundBoost"=dword:00000001
"SchedulerAssistThreadFlagOverride"=dword:00000001
"ThreadBoostType"=dword:00000002
"ThreadSchedulingModel"=dword:00000001

; Resource Sets
; Founded by Kizzimo
; Registry made and modified by Alchemy Tweaks
[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets]

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriElastic]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CortanaSpeechBackground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcess]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GeofenceTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\IoTStartupTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiDebugModeForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiDebugModeForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VoipActiveCallBackground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VoipActiveCallBackgroundPriority]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VoipActiveCallForeground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VoipForegroundWorker]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VoipSuspendedBackground]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VoipWorker]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"

[HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn]
"CPU"="UnmanagedAboveNormal"
"ExternalResources"="ResourceIntensive"
"Flags"="Foreground"
"Importance"="Critical"
"IO"="NoCap"
"Memory"="NoCap"
'@
	Set-Content -Path "$env:TEMP\RegistryExperimental.reg" -Value $MultilineComment -Force
	# import reg file
	Regedit.exe /S "$env:TEMP\RegistryExperimental.reg"
	Timeout T/5 | Out-Null
	# Remove-Item "$env:TEMP\RegistryExperimental.reg" -Force
#>


	
	# FOXOS POST INSTALL
	# WMIC
	# if ((Get-WindowsCapability -Online | Where-Object { $_.Name -like "*WMIC*" }).State -eq 'NotPresent') { Add-WindowsCapability -Online -Name WMIC }

	# DevManView
	# needed for "Deleting Devices in Device Manager" tweaks
	Invoke-WebRequest -Uri "https://www.nirsoft.net/utils/devmanview.zip" -OutFile "$env:TEMP\devmanview.zip"; Expand-Archive "$env:TEMP\devmanview.zip" "$env:TEMP\DevManView" -Force; Move-Item "$env:TEMP\DevManView\DevManView.exe" "$env:SystemRoot\System32\DevManView.exe" -Force; Remove-Item "$env:TEMP\devmanview.zip","$env:TEMP\DevManView" -Recurse -Force
	Invoke-WebRequest -Uri "https://github.com/ManuelBiscotti/Test/raw/refs/heads/main/tools/Cat10IdleOff.pow" -OutFile "$env:TEMP\Cat10IdleOff.pow"

	$batchCode = @'
@echo off && title PreSetup2
@echo off
:: Start maximized
if not "%1" == "max" start /MAX /wait cmd /c %0 max & exit/b
@REM mode 800
setlocal enabledelayedexpansion
title FoxOS W11 Post-Install Tweaks

set "CMDLINE=RED=[31m,S_GRAY=[90m,S_RED=[91m,S_GREEN=[92m,S_YELLOW=[93m,S_MAGENTA=[95m,S_WHITE=[97m,B_BLACK=[40m,B_YELLOW=[43m,UNDERLINE=[4m,_UNDERLINE=[24m"
set "%CMDLINE:,=" & set "%"
:: Credits to Artanis for colors

color C
echo.                                                                                               
echo.                                                                                               
echo.                                                                                         
echo.                                :~:                                                                
echo.                             .*?7??.                                                                
echo.                          .*7??7?J?                                                                 
echo.                        *????* *?J~                                                                 
echo.                     .~7J7*.   :?J~                                                                 
echo.                   .~?J??.     .???.                                                                
echo.                 .~?J??????777??7???                                                                
echo.                *?J????????????J????~                                                               
echo.              .7J???????????????????J?.                                                             
echo.             :?J???????????????????????~.                                                           
echo.            *?????????????????????????JJ??:                         .:*~??777??~:.                  
echo.           *???????????????????JJ???777?7JJ7~:.                 .:~7???7??~~??7???7?:               
echo.          :????????????????J?7?~*:..     :~7?J?7?*:.          :???J?~:          .*??J7*             
echo.          7????????????J???*.               .:~?7????7?.    .??J??????7~:          .~?J7:           
echo.        *J??????????J??:.                      :??J?~.    *?J?????????J?7~.         .???*          
echo.        7?????????J?~.                    .:*??J??*.     *???????????????J?*.:*??77777?JJ*         
echo.        .??????????~.              ...:*~?7?J?7?*.       :??????????????????J???7?~~~~~~???         
echo.        :???????J7:              :7??????7?~*.           7????????????????J??*.                     
echo.        :??????J7.             .?????:...               .?????????????????~.                        
echo.        .?????J7              :?J????~                  .????????????????.                          
echo.         7????7.             *???????J7*                 7??????????????                            
echo.         ~J???*             :???????????7:               *?????????????.                            
echo.         .???7             .??????????????7*              ?J?????????J?                             
echo.          *JJ*             ~J???????????????7~:           .7???????????                             
echo.           ?J:            .??????????????????J?7~:.        :???????????.                            
echo.            ?.            :?????????????????????J???*.      :?????????J~                            
echo.                          *J???????????????????????JJ?~.     :??????????*                           
echo.                          :???????????????????????????J?*     *??????????.                          
echo.                          .??????????????????????????????~     ~J???????J7                          
echo.                           7?????????????????????????????J*    .??????????:                         
echo.                           *???????????????????????????????.    ?????????J*                         
echo.                            ~J?????????????????????????????.    ?J??????J?.                         
echo.                             ~???????????????????????????J?    .7?????J?7.                          
echo.                              *7J???????????????????????J7.    ?J?JJ???:                            
echo.                                *7?J?????????????????J?7*    :7??7?~:.                              
echo.                                  :~7???JJJJ???JJJ??7?:     :*:..                                   
echo.                                     .:**~??????~~*.       ..                                           
echo.
echo.                                                                                               
echo.
echo.
echo.                                                                                                                                                                                                                                                                                                                                                                                                


echo.
echo.
echo 	!S_WHITE!The ISO was made by CatGamerOP on Discord.
echo 	The ISO is free and is NOT for sale.
echo 	You can download it from the official FoxOS Discord Server: !S_MAGENTA!https://discord.gg/4Gg8n6WhPN
timeout 4 >NUL 2>&1
echo.
echo.
echo 	!S_GRAY!Applying Windows Tweaks...

echo 	!S_GRAY!Importing Power Plan
	powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  	"Invoke-WebRequest -Uri 'https://github.com/ManuelBiscotti/Test/raw/refs/heads/main/tools/Cat10IdleOff.pow' -OutFile \"$env:TEMP\Cat10IdleOff.pow\" -UseBasicParsing"
	powercfg -import "%TEMP%\Cat10IdleOff.pow"
	for /f "tokens=3" %%G in ('powercfg -list ^| findstr /i "Cat10IdleOff"') do set GUID=%%G
	if defined GUID (
    	powercfg -setactive %GUID%
    	echo Power plan "Cat10IdleOff" activated successfully.
	) else (
    	echo Failed to locate imported power plan.
	)

echo 	Setting Colors
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "4284394495" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "4286102015" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "FFE5CEFFFFD3ABFFFEC691FFFFB978FFFFAB5EFFFF9E44FFFE8C21FF88179800" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4286102015" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3305093496" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3305093496" /f >NUL 2>&1
	reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "4284394495" /f >NUL 2>&1
	reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "4286102015" /f >NUL 2>&1
	reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "FFE5CEFFFFD3ABFFFEC691FFFFB978FFFFAB5EFFFF9E44FFFE8C21FF88179800" /f >NUL 2>&1
	reg add "HKU\.DEFAULT\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4286102015" /f >NUL 2>&1
	reg add "HKU\.DEFAULT\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3305093496" /f >NUL 2>&1
	reg add "HKU\.DEFAULT\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3305093496" /f >NUL 2>&1

echo 	Setting Win32 Priority to 18 hex
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "24" /f >NUL 2>&1

echo 	Setting Nlasvc dependency
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "DependOnService" /t REG_MULTI_SZ /d "NSI\0RpcSs\0TcpIp" /f >NUL 2>&1

echo 	Registry Cleanup
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\HotStart" /f >NUL 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Sidebar" /f >NUL 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Telephony" /f >NUL 2>&1
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Screensavers" /f >NUL 2>&1
	reg delete "HKCU\Printers" /f >NUL 2>&1
	reg delete "HKLM\SYSTEM\ControlSet001\Control\Print" /f >NUL 2>&1
	reg delete "HKLM\SYSTEM\ControlSet002\Control\Print" /f >NUL 2>&1

echo 	Disabling Spectre and Meltdown patches...
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "33554435" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f >NUL 2>&1
	:: 23-06
	reg add "HKLM\Software\Microsoft\Ole\AppCompat" /v "RequireIntegrityActivationAuthenticationLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
	powershell set-ProcessMitigation -System -Disable DEP, StrictHandle, SEHOP >NUL 2>&1

echo 	Applying Power Settings
	powercfg -h off >NUL 2>&1
	:: 23-06
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "AwayModeEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1

echo 	Autoplay Tweaks
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\CameraAlternate\ShowPicturesOnArrival" /ve /t REG_SZ /d "MSTakeNoAction" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\StorageOnArrival" /ve /t REG_SZ /d "MSTakeNoAction" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\CameraAlternate\ShowPicturesOnArrival" /ve /t REG_SZ /d "MSTakeNoAction" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\StorageOnArrival" /ve /t REG_SZ /d "MSTakeNoAction" /f >NUL 2>&1

echo 	Disabling Remote Terminal Services Logons to the Server
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "WinStationsDisabled" /t REG_SZ /d "1" /f >NUL 2>&1

@REM echo 	Disabling Remote Font Boot Cache
@REM 	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\GRE_Initialize" /v "DisableRemoteFontBootCache" /t REG_DWORD /d "1" /f >NUL 2>&1
@REM 	reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\GRE_Initialize" /v "DisableRemoteFontBootCache" /t REG_DWORD /d "1" /f >NUL 2>&1
@REM 	reg add "HKLM\SYSTEM\CurrentControlSet\Control\MUI\StringCacheSettings" /v "StringCacheGeneration" /t REG_DWORD /d "0" /f >NUL 2>&1

echo 	Disabling Null Session (restrictanonymous)
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "disabledomaincreds" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "restrictanonymous" /t REG_DWORD /d "1" /f >NUL 2>&1

echo 	Disabling Component Based Servicing Logs and DCOM
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableDpxLog" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableDpxLog" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Ole" /v "EnableDCOM" /t REG_SZ /d "N" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Ole" /v "EnableDCOM" /t REG_SZ /d "N" /f >NUL 2>&1
	
echo 	Storage Tweaks
	:: Disable HIPM and DIPM, HDD Parking
	FOR /F "eol=E" %%a in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
		REG ADD "%%a" /F /V "EnableHIPM" /T REG_DWORD /d 0 >NUL 2>&1
		REG ADD "%%a" /F /V "EnableDIPM" /T REG_DWORD /d 0 >NUL 2>&1
		REG ADD "%%a" /F /V "EnableHDDParking" /T REG_DWORD /d 0 >NUL 2>&1

		FOR /F "tokens=*" %%z IN ("%%a") DO (
			SET STR=%%z
			SET STR=!STR:HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\=!
			ECHO 	Disabling HIPM and DIPM in !STR!
		)
	)

	:: Set all IoLatencyCaps to 0
	FOR /F "eol=E" %%a in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
		REG ADD "%%a" /F /V "IoLatencyCap" /T REG_DWORD /d 0 >NUL 2>&1

		FOR /F "tokens=*" %%z IN ("%%a") DO (
			SET STR=%%z
			SET STR=!STR:HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\=!
			SET STR=!STR:\Parameters=!
			ECHO 	Setting IoLatencyCap to 0 in !STR!
		)
	)

	:: Disable StorPort idle
	for /f "tokens=*" %%s in ('reg query "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort" ^| findstr /e "StorPort"') do Reg add "%%s" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f >NUL 2>&1

	:: Disable NTFS Last Access Timestamp
	fsutil behavior set disablelastaccess 1 >NUL 2>&1
	fsutil repair set C: 0 > NUL 2>&1
	fsutil behavior set disablespotcorruptionhandling 1 > NUL 2>&1
	fsutil behavior set quotanotify 86400 > NUL 2>&1
	@REM reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >NUL 2>&1

	:: Disable Write Cache Buffer
	for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI"^| findstr "HKEY"') do (
		for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg add "%%a\Device Parameters\Disk" /v "CacheIsPowerProtected" /t REG_DWORD /d "1" /f > NUL 2>&1
	)
	@REM for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI"^| findstr "HKEY"') do (
	@REM 	for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg add "%%a\Device Parameters\Disk" /v "UserWriteCacheSetting" /t REG_DWORD /d "1" /f > NUL 2>&1
	@REM )

echo 	Setting CSRSS Priority to High Priority
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >NUL 2>&1
	reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "C:\Windows\System32\Fox.png" /f >NUL 2>&1

echo 	Network Tweaks
	for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >nul 2>&1
	for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >nul 2>&1
	for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "HKLM\System\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
	powershell Set-NetAdapterBinding -Name * -ComponentID ms_msclient, ms_server -Enabled $false >nul 2>&1

echo 	Disabling USB Idle
	for %%a in (
		EnhancedPowerManagementEnabled
		AllowIdleIrpInD3
		EnableSelectiveSuspend
		DeviceSelectiveSuspended
		SelectiveSuspendEnabled
		SelectiveSuspendOn
		EnumerationRetryCount
		ExtPropDescSemaphore
		WaitWakeEnabled
		D3ColdSupported
		WdfDirectedPowerTransitionEnable
		EnableIdlePowerManagement
		IdleInWorkingState
		IoLatencyCap
	) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%a" ^| findstr "HKEY"') do reg add "%%b" /v "%%a" /t REG_DWORD /d "0" /f > NUL 2>&1


echo 	GPU Tweaks
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrLimitTime" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrLimitCount" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DisableBadDriverCheckForHwProtection" /t REG_DWORD /d "1" /f >NUL 2>&1

echo 	Disabling Gamebar, Fullscreen Optimization
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "MaximumRecordLength" /t REG_QWORD /d "0x00d088c310000000" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "SystemAudioGain" /t REG_QWORD /d "0x1027000000000000" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneGain" /t REG_QWORD /d "0x1027000000000000" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "KGLRevision" /t REG_DWORD /d "1824" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "KGLToGCSUpdatedRevision" /t REG_DWORD /d "1824" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioEncodingBitrate" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CustomVideoEncodingBitrate" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CustomVideoEncodingHeight" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CustomVideoEncodingWidth" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalBufferLength" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalBufferLengthUnit" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureOnBatteryAllowed" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureOnWirelessDisplayAllowed" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VideoEncodingBitrateMode" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VideoEncodingResolutionMode" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VideoEncodingFrameRateMode" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "EchoCancellationEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKToggleGameBar" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMToggleGameBar" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKSaveHistoricalVideo" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMSaveHistoricalVideo" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKToggleRecording" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMToggleRecording" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKTakeScreenshot" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMTakeScreenshot" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKToggleRecordingIndicator" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMToggleRecordingIndicator" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKToggleMicrophoneCapture" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMToggleMicrophoneCapture" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKToggleCameraCapture" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMToggleCameraCapture" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKToggleBroadcast" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "VKMToggleBroadcast" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >NUL 2>&1
	reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1 
	reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >NUL 2>&1
	reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg delete "HKCU\System\GameConfigStore\Children" /f >NUL 2>&1
	reg delete "HKCU\System\GameConfigStore\Parents" /f >NUL 2>&1
	reg add "HKEY_USERS\.DEFAULT\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKEY_USERS\.DEFAULT\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >NUL 2>&1
	reg add "HKEY_USERS\.DEFAULT\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKEY_USERS\.DEFAULT\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >NUL 2>&1
	reg add "HKEY_USERS\.DEFAULT\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg delete "HKEY_USERS\.DEFAULT\System\GameConfigStore\Children" /f >NUL 2>&1
	reg delete "HKEY_USERS\.DEFAULT\System\GameConfigStore\Parents" /f >NUL 2>&1
	reg add "HKLM\Software\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f >NUL 2>&1

	reg add "HKEY_USERS\S-1-5-18\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKEY_USERS\S-1-5-18\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKEY_USERS\S-1-5-19\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1 
	reg add "HKEY_USERS\S-1-5-19\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKEY_USERS\S-1-5-20\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1 
	reg add "HKEY_USERS\S-1-5-20\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1

echo 	Disabling DMA Remapping
	reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\DmaGuard\DeviceEnumerationPolicy" /v "value" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\pci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Services\pci\Parameters" /v "DmaRemappingOnHiberPath" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\storahci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Services\storahci\Parameters" /v "DmaRemappingOnHiberPath" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\stornvme\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\ControlSet001\Services\stornvme\Parameters" /v "DmaRemappingOnHiberPath" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\USBXHCI\Parameters" /v "DmaRemappingCompatibleSelfhost" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\USBXHCI\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >NUL 2>&1
	:: for /f "tokens=1" %%i in ('driverquery') do reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%i\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >NUL 2>&1
	@REM reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "legalnoticecaption" /t REG_SZ /d "Welcome to FoxOS, Custom Windows for Gaming. The ISO Was Made by CatGamerOP" /f >NUL 2>&1
	@REM reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "legalnoticetext" /t REG_SZ /d "The ISO is free and is NOT for sale. You can download it from the official FoxOS Discord Server https://discord.gg/4Gg8n6WhPN. IF YOU PAID FOR THIS ISO, YOU WERE SCAMMED, DEMAND A REFUND." /f >NUL 2>&1

echo 	BCDedit Tweaks
	@REM bcdedit /set {globalsettings} custom:16000067 true >NUL 2>&1
	@REM bcdedit /set {globalsettings} custom:16000068 true >NUL 2>&1
	@REM bcdedit /set {globalsettings} custom:16000069 true >NUL 2>&1
	@REM bcdedit /set {current} description "FoxOS W11" >NUL 2>&1
	bcdedit /set bootmenupolicy legacy >NUL 2>&1
	bcdedit /set quietboot Yes >NUL 2>&1
	bcdedit /set bootux Disabled >NUL 2>&1
	bcdedit /set bootlog no >NUL 2>&1
	bcdedit /timeout 10 >NUL 2>&1

	:: bcdedit /set useplatformtick yes >NUL 2>&1
	:: Makes polling rate worse
	:: bcdedit /set tscsyncpolicy legacy >NUL 2>&1
	:: Kept Windows Default
	bcdedit /set disabledynamictick Yes >NUL 2>&1

	bcdedit /event off >NUL 2>&1
	bcdedit /bootdebug off >NUL 2>&1
	bcdedit /set debug No >NUL 2>&1
	
	bcdedit /set ems No >NUL 2>&1
	bcdedit /set bootems No  >NUL 2>&1
	
	bcdedit /set hypervisorlaunchtype Off >NUL 2>&1
	bcdedit /set vsmlaunchtype Off >NUL 2>&1

	bcdedit /set tpmbootentropy ForceDisable >NUL 2>&1
	bcdedit /set nx alwaysoff >NUL 2>&1
	bcdedit /set integrityservices disable >NUL 2>&1
	bcdedit /set allowedinmemorysettings 0 >NUL 2>&1
	bcdedit /set perfmem 0 >NUL 2>&1
	bcdedit /set isolatedcontext No >NUL 2>&1

	bcdedit /set recoveryenabled No >NUL 2>&1

	bcdedit /deletevalue useplatformclock >NUL 2>&1
	bcdedit /deletevalue usefirmwarepcisettings >NUL 2>&1

echo 	Deleting Obsolete Autoruns Entries
	reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Font Drivers" /v "Adobe Type Manager" /f >NUL 2>&1
	reg delete "HKLM\System\ControlSet001\Control\Terminal Server\Wds\rdpwd" /v "StartupPrograms" /f >NUL 2>&1

echo 	Services Tweaks
	reg add "HKLM\SYSTEM\CurrentControlSet\services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\services\iphlpsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\services\Themes" /v "Start" /t REG_DWORD /d "4" / >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\services\WSearch" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1

echo 	Drivers Tweaks
	reg add "HKLM\SYSTEM\CurrentControlSet\services\Beep" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\services\npsvctrig" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\services\vwififlt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\services\wanarp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\services\Wanarpv6" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
	sc config luafv start= disabled >NUL 2>&1
	
@REM echo 	Restoring Default Photo Viewer
@REM	for %%i in (tif tiff bmp dib gif jfif jpe jpeg jpg jxr png) do (
@REM        reg add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".%%~i" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f) >NUL 2>&1
@REM	for %%a in (tif tiff bmp dib gif jfif jpe jpeg jpg jxr png) do (
@REM		reg add "HKCU\SOFTWARE\Classes.%%~a" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f) >NUL 2>&1

echo 	Deleting Devices in Device Manager
	DevManView /disable "Microsoft Radio Device Enumeration Bus" >NUL 2>&1
	DevManView /disable "Microsoft RRAS Root Enumerator" >NUL 2>&1
    DevManView /disable "Microsoft Device Association Root Enumerator" >NUL 2>&1
	DevManView /uninstall "Composite Bus Enumerator" >NUL 2>&1
	DevManView /uninstall "NDIS Virtual Network Adapter Enumerator" >NUL 2>&1
	DevManView /uninstall "UMBus Root Bus Enumerator" >NUL 2>&1
    DevManView /uninstall "Microsoft Virtual Drive Enumerator Driver" >NUL 2>&1
    DevManView /uninstall "File as Volume Driver" >NUL 2>&1
    DevManView /uninstall "Microsoft Kernel Debug Network Adapter" >NUL 2>&1
    sc delete CompositeBus >NUL 2>&1
    sc delete NdisVirtualBus >NUL 2>&1
	sc delete umbus >NUL 2>&1
	
echo 	Disabling Unnecessary Scheduled Tasks
	for %%i in ("Application Experience\Microsoft Compatibility Appraiser" "Application Experience\ProgramDataUpdater"
	"Application Experience\StartupAppTask" "Customer Experience Improvement Program\Consolidator"
	"Customer Experience Improvement Program\KernelCeipTask" "Customer Experience Improvement Program\UsbCeip"
	"Customer Experience Improvement Program\Uploader" "Autochk\Proxy" "CloudExperienceHost\CreateObjectTask"
	"DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" "DiskFootprint\Diagnostics"
	"UpdateOrchestrator\Schedule Scan" "WindowsUpdate\Scheduled Start" "Servicing\StartComponentCleanup" 
    "Recovery Environment\VerifyWinRE" "EDP\StorageCardEncryption Task" "BitLocker\BitLocker Encrypt All Drives" 
    "BitLocker\BitLocker MDM policy Refresh" "ApplicationData\DsSvcCleanup" "International\Synchronize Language Settings") do schtasks /change /tn "\Microsoft\Windows\%%~i" /disable >NUL 2>&1

echo 	Disabling Unnecessary Scheduled Tasks 2
	for %%i in ("Application Experience\SdbinstMergeDbTask" "InstallService\ScanForUpdates" "InstallService\ScanForUpdatesAsUser" "InstallService\SmartRetry"
	"PI\SecureBootEncodeUEFI" "PI\Secure-Boot-Update" "PI\Sqm-Tasks" "Registry\RegIdleBackup" "Shell\ThemesSyncedImageDownload"
	"SoftwareProtectionPlatform\SvcRestartTask") do schtasks /change /tn "\Microsoft\Windows\%%~i" /disable >NUL 2>&1
	schtasks /delete /tn "\Microsoft\Windows\Application Experience\AitAgent" /f >NUL 2>&1

echo 	Disabling Unnecessary Scheduled Tasks 3
	for %%i in ("ApplicationData\appuriverifierdaily" "ApplicationData\appuriverifierinstall" "AppxDeploymentClient\Pre-staged app cleanup"
	"CertificateServicesClient\UserTask-Roam" "DUSM\dusmtask" "Data Integrity Scan\Data Integrity Scan for Crash Recovery"
	"Data Integrity Scan\Data Integrity Scan" "Diagnosis\Scheduled" "DiskCleanup\SilentCleanup" "DiskFootprint\StorageSense"
	"License Manager\TempSignedLicenseExchange" "Location\WindowsActionDialog" "Management\Provisioning\Logon"
	"NlaSvc\WiFiTask" "RetailDemo\CleanupOfflineContent" "Shell\FamilySafetyRefreshTask" "Shell\IndexerAutomaticMaintenance"
	"SoftwareProtectionPlatform\SvcRestartTaskLogon" "SoftwareProtectionPlatform\SvcRestartTaskNetwork" "SpacePort\SpaceAgentTask"
	"Speech\SpeechModelDownloadTask" "WCM\WiFiTask" "WDI\ResolutionHost" "WOF\WIM-Hash-Management" "WOF\WIM-Hash-Validation"
	"Windows Filtering Platform\BfeOnServiceStartTypeChange" "StateRepository\MaintenanceTasks" "MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
	"MemoryDiagnostic\RunFullMemoryDiagnostic" "Ras\MobilityManager" "PushToInstall\LoginCheck" "Time Synchronization\SynchronizeTime"
	"Time Synchronization\ForceSynchronizeTime" "Time Zone\SynchronizeTimeZone" "Wininet\CacheTask") do schtasks /change /tn "\Microsoft\Windows\%%~i" /disable >NUL 2>&1

echo 	Disabling Unnecessary Scheduled Tasks 4
	schtasks /change /tn "MicrosoftEdgeUpdateTaskMachineCore" /disable >NUL 2>&1
	schtasks /change /tn "MicrosoftEdgeUpdateTaskMachineUA" /disable >NUL 2>&1
	for %%i in ("WindowsUpdate\Refresh Group Policy Cache" "WaasMedic\PerformRemediation" "UpdateOrchestrator\UUS Failover Task"
	"UpdateOrchestrator\StartOobeAppsScanAfterUpdate" "UpdateOrchestrator\StartOobeAppsScan_LicenseAccepted" "UpdateOrchestrator\Start Oobe Expedite Work"
	"UpdateOrchestrator\Schedule Work" "UpdateOrchestrator\Schedule Scan Static Task" "UpdateOrchestrator\Schedule Scan"
	"UpdateOrchestrator\Report policies") do schtasks /change /tn "\Microsoft\Windows\%%~i" /disable >NUL 2>&1

@REM echo 	Renaming Partition
	@REM label C:FoxOS W11 >NUL 2>&1

echo 	Removing Optional Features
	DISM /Online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0 /norestart /quiet >NUL 2>&1
	DISM /Online /Remove-Capability /CapabilityName:MathRecognizer~~~~0.0.1.0 /norestart /quiet >NUL 2>&1
	DISM /Online /Remove-Capability /CapabilityName:Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0 /norestart /quiet >NUL 2>&1
	DISM /Online /Remove-Capability /CapabilityName:OneCoreUAP.OneSync~~~~0.0.1.0 /norestart /quiet >NUL 2>&1

echo 	Windows 11 Stuff
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f >NUL 2>&1
	@REM reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f >NUL 2>&1 breaks the Finals
	:: Changing Context Menu to W10
	reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f >NUL 2>&1

echo 	Disabling Visual Effects
	reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f >NUL 2>&1
	reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >NUL 2>&1
	reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f >NUL 2>&1
	
echo 	Deleting UserAssist Hashes (TrackProgs)
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecommendations" /t REG_DWORD /d "0" /f >NUL 2>&1

	for /f "tokens=*" %%k in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"') do (
		reg delete "%%k" /f >NUL 2>&1
	)

echo 	Disabling Reserved Storage (amitxv)
	DISM /Online /Set-ReservedStorageState /State:Disabled >NUL 2>&1

echo 	Disabling Scheduled Defrag
	@REM reg add "HKLM\Software\Microsoft\Dfrg\TaskSettings" /v "fAllVolumes" /t REG_DWORD /d "1" /f >NUL 2>&1
	@REM reg add "HKLM\Software\Microsoft\Dfrg\TaskSettings" /v "fExclude" /t REG_DWORD /d "0" /f >NUL 2>&1
	@REM reg add "HKLM\Software\Microsoft\Dfrg\TaskSettings" /v "Volumes" /t REG_SZ /d " " /f >NUL 2>&1
	@REM reg add "HKLM\Software\Microsoft\Dfrg\TaskSettings" /v "TaskFrequency" /t REG_DWORD /d "3" /f >NUL 2>&1
	@REM reg add "HKLM\Software\Microsoft\Dfrg\TaskSettings" /v "fDeadlineEnabled" /t REG_DWORD /d "1" /f >NUL 2>&1
	schtasks /change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable >NUL 2>&1
	:: NOT APPLIED
@REM echo 	Removing Microcode Patches TEST ICACLS
@REM takeown /f "%SystemRoot%\System32\mcupdate_GenuineIntel.dll" >NUL 2>&1
@REM 	takeown /f "%SystemRoot%\System32\mcupdate_AuthenticAMD.dll" >NUL 2>&1
@REM icacls "%SystemRoot%\System32\mcupdate_GenuineIntel.dll" /grant "%USERNAME%":F /t >NUL 2>&1
@REM 	icacls "%SystemRoot%\System32\mcupdate_AuthenticAMD.dll" /grant "%USERNAME%":F /t >NUL 2>&1
@REM del /s /q /f "%SystemRoot%\System32\mcupdate_GenuineIntel.dll" >NUL 2>&1
@REM 	del /s /q /f "%SystemRoot%\System32\mcupdate_AuthenticAMD.dll" >NUL 2>&1

echo 	Disabling Firewall
	reg add "HKLM\System\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "DisableNotifications" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "DisableNotifications" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >NUL 2>&1
	NetSh Advfirewall set allprofiles state off >NUL 2>&1

echo 	Disabling LogPages
	reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Windows\Win32kWPP\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Windows\Win32kWPP\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Windows\Win32knsWPP\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Windows\Win32knsWPP\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\USBHUB3\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\System\ControlSet001\Services\USBHUB3\Parameters\Wdf" /v "LogPages" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >nul 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >nul 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >nul 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "LogPages" /t REG_DWORD /d "0" /f >nul 2>&1

	@REM echo 	Disabling GamebarPresenceWriter
	@REM 	takeown /f "C:\Windows\System32\GameBarPresenceWriter.exe" >NUL 2>&1
	@REM 	icacls "C:\Windows\System32\GameBarPresenceWriter.exe" /grant "%USERNAME%:F" >NUL 2>&1
	@REM 	move C:\Windows\System32\GameBarPresenceWriter.exe C:\Windows >NUL 2>&1
	@REM subinacl /regkey HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter /setowner=%Username%
	@REM reg add "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f >NUL 2>&1
	:: NOT APPLIED

echo 	Windows Hardening
	:: Disabling RPC usage from a remote asset interacting with scheduled tasks
	reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule" /v DisableRpcOverTcp /t REG_DWORD /d 1 /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v RestrictAnonymousSAM /t REG_DWORD /d 1 /f >NUL 2>&1
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v RestrictAnonymous /t REG_DWORD /d 1 /f >NUL 2>&1
	:: Disabling RPC usage from a remote asset interacting with services
	reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v DisableRemoteScmEndpoints /t REG_DWORD /d 1 /f >NUL 2>&1
	:: Prevent sharing of local drives via Remote Desktop Session Hosts
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableCdm /t REG_DWORD /d 1 /f >NUL 2>&1
	:: Disable solicited remote assistance
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >NUL 2>&1
	:: Disable Client connectivity
	Change Logon /Disable >NUL 2>&1
	:: Disable Terminal server https://learn.microsoft.com/ru-ru/troubleshoot/azure/virtual-machines/windows/troubleshoot-rdp-general-error
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v TSEnabled /t REG_DWORD /d 0 /f >NUL 2>&1


echo 	Removing Edge Startup Items
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch_C09E690C3F322367E058F9F0FC90C11A" /f >NUL 2>&1
	reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /f >NUL 2>&1
	schtasks /delete /tn \MicrosoftEdgeUpdateBrowserReplacementTask /F >NUL 2>&1
	schtasks /delete /tn \MicrosoftEdgeUpdateTaskMachineCore /F >NUL 2>&1
	schtasks /delete /tn \MicrosoftEdgeUpdateTaskMachineUA /F >NUL 2>&1
	sc delete edgeupdate >NUL 2>&1
	sc delete edgeupdatem >NUL 2>&1
	sc delete MicrosoftEdgeElevationService >NUL 2>&1
	reg delete "HKLM\System\ControlSet001\Services\edgeupdate" /f >NUL 2>&1
	reg delete "HKLM\System\ControlSet001\Services\edgeupdatem" /f >NUL 2>&1
	reg delete "HKLM\System\ControlSet001\Services\MicrosoftEdgeElevationService" /f >NUL 2>&1
	powershell Remove-AppxPackage Microsoft.Windows.Ai.Copilot.Provider_1.0.3.0_neutral__8wekyb3d8bbwe -AllUsers >NUL 2>&1
	@REM dism /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Windows.Ai.Copilot.Provider_1.0.3.0_neutral__8wekyb3d8bbwe /AllUsers >NUL 2>&1

	:: Edge Telemetry
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "TrackingPrevention" /t REG_DWORD /d "3" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "AddressBarMicrosoftSearchInBingProviderEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowPrelaunch" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "DoNotTrack" /t REG_DWORD /d "1" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d "0" /f >NUL 2>&1

	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "EnableExtendedBooksTelemetry" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\BooksLibrary" /v "EnableExtendedBooksTelemetry" /t REG_DWORD /d "0" /f >NUL 2>&1

	:: Remove updates
	rmdir /S /Q "C:\Program Files (x86)\Microsoft\EdgeUpdate" >NUL 2>&1

echo 	Disabling Telemetry WINEVT
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Kernel-EventTracing/Admin" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1

	set "WinEvtKeys=Cellcore DefenderApiLogger DefenderAuditLogger Diagtrack-Listener ReFSLog"
	for %%K in (%WinEvtKeys%) do (
		set "WinEvtPath=HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\%%K"
		reg query "!WinEvtPath!" >NUL 2>&1

		if !errorlevel! equ 0 (
			reg add "!WinEvtPath!" /v Start /t REG_DWORD /d 0 /f >NUL 2>&1
		)
	)

echo 	Disabling Background App Diagnostic Log
	powershell Disable-AppBackgroundTaskDiagnosticLog >NUL 2>&1

echo 	Disabling Media Player Usage Tracking
	reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f >NUL 2>&1

echo 	Track Only Important Events (Auditpol)
	Auditpol /set /subcategory:"Process Termination" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"RPC Events" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"DPAPI Activity" /success:disable /failure:disable >NUL 2>&1
	Auditpol /set /subcategory:"IPsec Driver" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"Other System Events" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"Security State Change" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"Security System Extension" /success:disable /failure:enable >NUL 2>&1
	Auditpol /set /subcategory:"System Integrity" /success:disable /failure:enable >NUL 2>&1

echo 	Setting Powershell Policy Unrestricted
	powershell Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force >NUL 2>&1
	powershell Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force >NUL 2>&1

echo 	Disabling Scheduled Diagnostics
	reg add "HKLM\Software\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f >NUL 2>&1


:: echo 	Rebooting...
::	shutdown /r -t 5 >NUL 2>&1
'@
	$batPath = "$env:TEMP\FoxOSPostInstall.bat"
	Set-Content -Path $batPath -Value $batchCode -Encoding ASCII
	Start-Process -FilePath $batPath -Wait
	# Remove-Item $batPath -Force -ErrorAction SilentlyContinue
}