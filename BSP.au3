Opt("WinTextMatchMode", 4)

Main()

Func Main()

	$bRunning = False

	While True

		#Region ; Launch BeatSync Console on BeatSaber Startup
		If Not $bRunning And ProcessExists("Beat Saber.exe") Then
			$bRunning = True
			Run("C:\BeatSyncConsole\BeatSyncConsole.exe", "C:\BeatSyncConsole")
			Do
				Sleep(100)
			Until WinExists("[REGEXPTITLE:.*BeatSyncConsole.exe; Class:ConsoleWindowClass]")
			WinActivate("[REGEXPTITLE:.*BeatSyncConsole.exe; Class:ConsoleWindowClass]")
			Send("{ENTER}")
			Do
				Sleep(100)
			Until Not WinExists("[REGEXPTITLE:.*BeatSyncConsole.exe; Class:ConsoleWindowClass]")
			SoundPlay(@WindowsDir & "\media\Alarm03.wav", 1)
		ElseIf $bRunning And Not ProcessExists("Beat Saber.exe") Then
			$bRunning = False
		EndIf
		#EndRegion

	WEnd

EndFunc