; NSIS Modern User Interface
; PhotoQT Setup

;--------------------------------
; INCLUDES

	; Include Modern UI
	!include MUI2.nsh

	; Include stuff for nsdialog
	!include LogicLib.nsh
	!include nsDialogs.nsh

	; Register app for filetypes
	!include "FileAssociation.nsh"

	; For 32/64-Bit detection
	!include x64.nsh

;--------------------------------
; GENERAL

	; Name and file
	Name "PhotoQt"
	OutFile "photoqt-1.2-full.exe"

	; Default installation folder
	InstallDir "$PROGRAMFILES\PhotoQt"

	; Get installation folder from registry if available
	InstallDirRegKey HKCU "Software\PhotoQt" ""

	; Request application privileges for Windows Vista
	RequestExecutionLevel admin

;--------------------------------
; INTERFACE SETTINGS

	!define MUI_ABORTWARNING
	!define MUI_ICON "icon_install.ico"

;--------------------------------
; PAGES


	; Welcome text
	!define MUI_WELCOMEPAGE_TITLE $(WelcomePage_Title)
	!define MUI_WELCOMEPAGE_TEXT $(WelcomePage_Text)

	; Installer pages
	!insertmacro MUI_PAGE_WELCOME
	!insertmacro MUI_PAGE_LICENSE "license.txt"
	!insertmacro MUI_PAGE_DIRECTORY
	!insertmacro MUI_PAGE_INSTFILES
	Page custom FinalStepsInit FinalStepsLeave
	!insertmacro MUI_PAGE_FINISH

	; UNinstaller pages
	!insertmacro MUI_UNPAGE_CONFIRM
	!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
; LANGUAGES

	!insertmacro MUI_LANGUAGE "English"
;	!insertmacro MUI_LANGUAGE "German"

	!insertmacro LANGFILE_INCLUDE "translations\english.nsh"
;	!insertmacro LANGFILE_INCLUDE "translations\german.nsh"

;--------------------------------
; INSTALLER SECTIONS

Section "PhotoQt" SecDummy

	SetShellVarContext all

	; Install files

	SetOutPath "$INSTDIR"
	${If} ${RunningX64}
		File "app64_full\libbz2-1.dll"
		File "app64_full\libEGL.dll"
		File "app64_full\libexiv2.dll"
		File "app64_full\libexpat-1.dll"
		File "app64_full\libfreetype-6.dll"
		File "app64_full\libgcc_s_seh-1.dll"
		File "app64_full\libgif-7.dll"
		File "app64_full\libGLESv2.dll"
		File "app64_full\libglib-2.0-0.dll"
		File "app64_full\libgomp-1.dll"
		File "app64_full\libGraphicsMagick-3.dll"
		File "app64_full\libGraphicsMagick++-3.dll"
		File "app64_full\libharfbuzz-0.dll"
		File "app64_full\libiconv-2.dll"
		File "app64_full\libintl-8.dll"
		File "app64_full\libjpeg-8.dll"
		File "app64_full\libjpeg-62.dll"
		File "app64_full\libpcre-1.dll"
		File "app64_full\libpcre16-0.dll"
		File "app64_full\libpng16-16.dll"
		File "app64_full\libsqlite3-0.dll"
		File "app64_full\libstdc++-6.dll"
		File "app64_full\libtiff-5.dll"
		File "app64_full\libwebp-5.dll"
		File "app64_full\libwinpthread-1.dll"
		File "app64_full\libxml2-2.dll"
		File "app64_full\Qt5Core.dll"
		File "app64_full\Qt5Gui.dll"
		File "app64_full\Qt5Multimedia.dll"
		File "app64_full\Qt5Network.dll"
		File "app64_full\Qt5Svg.dll"
		File "app64_full\Qt5Sql.dll"
		File "app64_full\Qt5Widgets.dll"
		File "app64_full\zlib1.dll"

		File "app64_full\photoqt.exe"
	${Else}
		File "app32_full\libbz2-1.dll"
		File "app32_full\libEGL.dll"
		File "app32_full\libexiv2.dll"
		File "app32_full\libexpat-1.dll"
		File "app32_full\libfreetype-6.dll"
		File "app32_full\libgcc_s_sjlj-1.dll"
		File "app32_full\libgif-7.dll"
		File "app32_full\libGLESv2.dll"
		File "app32_full\libglib-2.0-0.dll"
		File "app32_full\libgomp-1.dll"
		File "app32_full\libGraphicsMagick-3.dll"
		File "app32_full\libGraphicsMagick++-3.dll"
		File "app32_full\libharfbuzz-0.dll"
		File "app32_full\libiconv-2.dll"
		File "app32_full\libintl-8.dll"
		File "app32_full\libjpeg-8.dll"
		File "app32_full\libjpeg-62.dll"
		File "app32_full\libpcre-1.dll"
		File "app32_full\libpcre16-0.dll"
		File "app32_full\libpng16-16.dll"
		File "app32_full\libsqlite3-0.dll"
		File "app32_full\libstdc++-6.dll"
		File "app32_full\libtiff-5.dll"
		File "app32_full\libwebp-5.dll"
		File "app32_full\libwinpthread-1.dll"
		File "app32_full\libxml2-2.dll"
		File "app32_full\Qt5Core.dll"
		File "app32_full\Qt5Gui.dll"
		File "app32_full\Qt5Multimedia.dll"
		File "app32_full\Qt5Network.dll"
		File "app32_full\Qt5Svg.dll"
		File "app32_full\Qt5Sql.dll"
		File "app32_full\Qt5Widgets.dll"
		File "app32_full\zlib1.dll"

		File "app32_full\photoqt.exe"
	${EndIf}

	File "license.txt"
	File "icon.ico"

	SetOutPath "$INSTDIR\sqldrivers"
	${If} ${RunningX64}
		File "app64_full\sqldrivers\qsqlite.dll"
	${Else}
		File "app32_full\sqldrivers\qsqlite.dll"
	${EndIf}

	SetOutPath "$INSTDIR\platforms"
	${If} ${RunningX64}
		File "app64_full\platforms\qwindows.dll"
	${Else}
		File "app32_full\platforms\qwindows.dll"
	${EndIf}

	SetOutPath "$INSTDIR\imageformats"
	${If} ${RunningX64}
		File "app64_full\imageformats\qdds.dll"
		File "app64_full\imageformats\qgif.dll"
		File "app64_full\imageformats\qicns.dll"
		File "app64_full\imageformats\qico.dll"
		File "app64_full\imageformats\qjp2.dll"
		File "app64_full\imageformats\qjpeg.dll"
		File "app64_full\imageformats\qmng.dll"
		File "app64_full\imageformats\qsvg.dll"
		File "app64_full\imageformats\qtga.dll"
		File "app64_full\imageformats\qtiff.dll"
		File "app64_full\imageformats\qwbmp.dll"
		File "app64_full\imageformats\qwebp.dll"
	${Else}
		File "app32_full\imageformats\qdds.dll"
		File "app32_full\imageformats\qgif.dll"
		File "app32_full\imageformats\qicns.dll"
		File "app32_full\imageformats\qico.dll"
		File "app32_full\imageformats\qjp2.dll"
		File "app32_full\imageformats\qjpeg.dll"
		File "app32_full\imageformats\qmng.dll"
		File "app32_full\imageformats\qsvg.dll"
		File "app32_full\imageformats\qtga.dll"
		File "app32_full\imageformats\qtiff.dll"
		File "app32_full\imageformats\qwbmp.dll"
		File "app32_full\imageformats\qwebp.dll"
	${EndIf}

	; Store installation folder
	WriteRegStr HKCU "Software\PhotoQt" "" $INSTDIR

	; Create uninstaller
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd


;--------------------------------
; INSTALLER FUNTIONS

Function .onInit
;!insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd


; Custom page (nsdialog)
Var Dialog

; Description text
Var LabelFiletypeDesc

; Variables for checkboxes and their states
Var RadioButtonNone
Var RadioButtonBasic
Var RadioButtonBasic_State
Var RadioButtonAdvanced
Var RadioButtonAdvanced_State
Var CheckboxPdfPs
Var CheckboxPdfPs_State
Var CheckboxPsdXcf
Var CheckboxPsdXcf_State

Var CheckboxStartMenu
Var CheckboxStartMenu_State
Var CheckboxDesktop
Var CheckboxDesktop_State

Function FinalStepsInit

	; Set header and subtitle
	!insertmacro MUI_HEADER_TEXT $(FinishPage_Title) $(FinishPage_Subtitle)

	; Create dialog
	nsDialogs::Create 1018
	Pop $Dialog
	${If} $Dialog == error
		Abort
	${EndIf}

	; Create description label
	${NSD_CreateLabel} 0 0 100% 24u $(FinishPage_Description)
	Pop $LabelFiletypeDesc


	; Create all the radiobuttons/checkboxes

	${NSD_CreateRadioButton} 0 25u 100% 12u $(FinishPage_RegisterNone)
	Pop $RadioButtonNone
	${NSD_OnClick} $RadioButtonNone FinalStepsDisEnable

	${NSD_CreateRadioButton} 0 38u 100% 12u $(FinishPage_RegisterMostCommon)
	Pop $RadioButtonBasic
	${NSD_OnClick} $RadioButtonBasic FinalStepsDisEnable

	${NSD_CreateRadioButton} 0 51u 100% 12u $(FinishPage_RegisterAll)
	Pop $RadioButtonAdvanced
	${NSD_Check} $RadioButtonAdvanced
	${NSD_OnClick} $RadioButtonAdvanced FinalStepsDisEnable

	${NSD_CreateCheckbox} 0 64u 100% 12u $(FinishPage_RegisterPdfPs)
	Pop $CheckboxPdfPs

	${NSD_CreateCheckbox} 0 77u 100% 12u $(FinishPage_RegisterPsdXcf)
	Pop $CheckboxPsdXcf

	${NSD_CreateHLine} 0 99u 100% 1u HLineBeforeDesktop

	${NSD_CreateCheckbox} 0 109u 100% 12u $(FinishPage_DesktopIcon)
	Pop $CheckboxDesktop
	${NSD_Check} $CheckboxDesktop

	${NSD_CreateCheckbox} 0 122u 100% 12u $(FinishPage_StartMenu)
	Pop $CheckboxStartMenu
	${NSD_Check} $CheckboxStartMenu


	; Finally, show dialog
	nsDialogs::Show

FunctionEnd

Function FinalStepsDisEnable

	${NSD_GetState} $RadioButtonAdvanced $RadioButtonAdvanced_State
	${If} $RadioButtonAdvanced_State == ${BST_CHECKED}
		EnableWindow $CheckboxPdfPs 1
		EnableWindow $CheckboxPsdXcf 1
	${Else}
		EnableWindow $CheckboxPdfPs 0
		EnableWindow $CheckboxPsdXcf 0
	${EndIf}

FunctionEnd

Function FinalStepsLeave

	SetShellVarContext all

	; Get checkbox states
	${NSD_GetState} $RadioButtonBasic $RadioButtonBasic_State
	${NSD_GetState} $RadioButtonAdvanced $RadioButtonAdvanced_State
	${NSD_GetState} $CheckboxPdfPs $CheckboxPdfPs_State
	${NSD_GetState} $CheckboxPsdXcf $CheckboxPsdXcf_State
	${NSD_GetState} $CheckboxDesktop $CheckboxDesktop_State
	${NSD_GetState} $CheckboxStartMenu $CheckboxStartMenu_State

	; Register basic file types
	${If} $RadioButtonBasic_State == ${BST_CHECKED}
	${OrIf} $RadioButtonAdvanced_State == ${BST_CHECKED}

		WriteRegStr HKCU "Software\PhotoQt" "fileformats" "basic"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".bmp" "Microsoft Windows bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".bitmap" "Microsoft Windows bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dds" "Direct Draw Surface"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".gif" "Graphics Interchange Format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".tif" "Tagged Image File Format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".tiff" "Tagged Image File Format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpeg2000" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jp2" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpc" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".j2k" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpf" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpx" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpm" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".mj2" "JPEG-2000 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".mng" "Multiple-image Network Graphics"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ico" "Microsoft Icon"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".icns" "Microsoft Icon"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpeg" "JPEG image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jpg" "JPEG image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".png" "Portable Network Graphics"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pbm" "Portable bitmap format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pgm" "Portable graymap format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ppm" "Portable pixmap format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".svg" "Scalable Vector Graphics"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".svgz" "Scalable Vector Graphics"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".xbm" "X Windows system bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".wbmp" "Wireless bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".webp" "Wireless bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".xpm" "X Windows system pixmap"

	${EndIf}

	; Register advanced file types
	${If} $RadioButtonAdvanced_State == ${BST_CHECKED}

		WriteRegStr HKCU "Software\PhotoQt" "fileformats" "advanced"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".avs" "AVS X image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".x" "AVS X image"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".cals" "Continuous Acquisition and Life-cycle Support Type 1 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".cal" "Continuous Acquisition and Life-cycle Support Type 1 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dcl" "Continuous Acquisition and Life-cycle Support Type 1 image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ras" "Continuous Acquisition and Life-cycle Support Type 1 image"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".cin" "Kodak Cineon"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".cut" "DR Halo"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".acr" "DICOM image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dcm" "DICOM image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dicom" "DICOM image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dic" "DICOM image"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dcx" "ZSoft IBM PC multi-page Paintbrush image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dib" "Device Independent Bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".dpx" "Digital Moving Picture Exchange"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".fax" "Group 3 Fax"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".fits" "Flexible Image Transport System"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".fts" "Flexible Image Transport System"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".fit" "Flexible Image Transport System"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".fpx" "FlashPix Format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".jng" "JPEG Network Graphics"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".mat" "MATLAT image format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".miff" "Magick image file format"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".mono" "Bi-level bitmap in little-endian order"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".mtv" "MTV Raytracing image format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".otb" "On-the-air bitmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".p7" "Xv's Visual Schnauzer thumbnail format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".palm" "Palm pixmap"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pam" "Portable Arbitrary Map format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pcd" "Photo CD"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pcds" "Photo CD"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pcx" "ZSoft IBM PC Paintbrush file"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pdb" "Palm Database ImageViewer format"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pict" "Apple Macintosh QuickDraw/PICT file"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pct" "Apple Macintosh QuickDraw/PICT file"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pic" "Apple Macintosh QuickDraw/PICT file"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pix" "Alias/Wavefront RLE image format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pal" "Alias/Wavefront RLE image format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pnm" "Portable anymap"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ptif" "Pyramid encoded TIFF"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ptiff" "Pyramid encoded TIFF"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".sfw" "Seattle File Works image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".sgi" "Irix RGB image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".sun" "SUN Rasterfile"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".tga" "Truevision Targe image"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".vicar" "VICAR rasterfile format"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".viff" "Khoros Visualization image file format"

		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".wpg" "Word Perfect Graphics file"
		!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".xwd" "X Windows system window dump"


		${If} $CheckboxPdfPs_State == ${BST_CHECKED}

			WriteRegStr HKCU "Software\PhotoQt" "fileformats_pdfps" "registered"

			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".epdf" "Encapsulated PDF"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".epi" "Encapsulated PostScript Interchange format"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".epsi" "Encapsulated PostScript Interchange format"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".eps" "Encapsulated PostScript"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".epsf" "Encapsulated PostScript"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".eps2" "Level II Encapsulated PostScript"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".eps3" "Level III Encapsulated PostScript"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ept" "Encapsulated PostScript Interchange format (TIFF preview)"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".pdf" "Portable Document Format"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ps" "PostScript"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ps2" "Level II PostScript"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".ps3" "Level III PostScript"

		${EndIf}

		${If} $CheckboxPsdXcf_State == ${BST_CHECKED}

			WriteRegStr HKCU "Software\PhotoQt" "fileformats_psdxcf" "registered"

			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".psb" "Large Photoshop Document"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".psd" "Photoshop Document"
			!insertmacro RegisterExtensionCall "$INSTDIR\photoqt.exe" ".xcf" "Gimp image"

		${EndIf}


	${EndIf}


	; Create desktop icon
	${If} $CheckboxDesktop_State == ${BST_CHECKED}

		CreateShortcut "$desktop\PhotoQt.lnk" "$instdir\photoqt.exe" "" "$INSTDIR\icon.ico" 0

	${EndIf}

	; Create startmenu entry
	${If} $CheckboxStartMenu_State == ${BST_CHECKED}

		CreateDirectory "$SMPROGRAMS\PhotoQt"
		CreateShortCut "$SMPROGRAMS\PhotoQt\Uninstall.lnk" "$INSTDIR\uninstall.exe"
		CreateShortCut "$SMPROGRAMS\PhotoQt\PhotoQt.lnk" "$INSTDIR\photoqt.exe"

	${EndIf}

	; Update icons
	System::Call 'shell32.dll::SHChangeNotify(i, i, i, i) v (0x08000000, 0, 0, 0)'

FunctionEnd

;--------------------------------
; UNINSTALLER SECTION

Section "Uninstall"

	SetShellVarContext all

	; Delete all files and directories

	Delete "$INSTDIR\libbz2-1.dll"
	Delete "$INSTDIR\libEGL.dll"
	Delete "$INSTDIR\libexiv2.dll"
	Delete "$INSTDIR\libexpat-1.dll"
	Delete "$INSTDIR\libfreetype-6.dll"
	Delete "$INSTDIR\libgcc_s_seh-1.dll"	; 64 Bit
	Delete "$INSTDIR\libgcc_s_sjlj-1.dll"	; 32 Bit
	Delete "$INSTDIR\libgif-7.dll"
	Delete "$INSTDIR\libGLESv2.dll"
	Delete "$INSTDIR\libgomp-1.dll"
	Delete "$INSTDIR\libGraphicsMagick-3.dll"
	Delete "$INSTDIR\libGraphicsMagick++-3.dll"
	Delete "$INSTDIR\libiconv-2.dll"
	Delete "$INSTDIR\libjpeg-8.dll"
	Delete "$INSTDIR\libjpeg-62.dll"
	Delete "$INSTDIR\libpcre16-0.dll"
	Delete "$INSTDIR\libpng16-16.dll"
	Delete "$INSTDIR\libsqlite3-0.dll"
	Delete "$INSTDIR\libstdc++-6.dll"
	Delete "$INSTDIR\libtiff-5.dll"
	Delete "$INSTDIR\libwebp-5.dll"
	Delete "$INSTDIR\libwinpthread-1.dll"
	Delete "$INSTDIR\libxml2-2.dll"
	Delete "$INSTDIR\Qt5Core.dll"
	Delete "$INSTDIR\Qt5Gui.dll"
	Delete "$INSTDIR\Qt5Multimedia.dll"
	Delete "$INSTDIR\Qt5Network.dll"
	Delete "$INSTDIR\Qt5Svg.dll"
	Delete "$INSTDIR\Qt5Sql.dll"
	Delete "$INSTDIR\Qt5Widgets.dll"
	Delete "$INSTDIR\zlib1.dll"

	Delete "$INSTDIR\license.txt"
	Delete "$INSTDIR\photoqt.exe"
	Delete "$INSTDIR\icon.ico"

	Delete "$INSTDIR\sqldrivers\qsqlite.dll"
	Delete "$INSTDIR\platforms\qwindows.dll"

	Delete "$INSTDIR\imageformats\qdds.dll"
	Delete "$INSTDIR\imageformats\qgif.dll"
	Delete "$INSTDIR\imageformats\qicns.dll"
	Delete "$INSTDIR\imageformats\qico.dll"
	Delete "$INSTDIR\imageformats\qjp2.dll"
	Delete "$INSTDIR\imageformats\qjpeg.dll"
	Delete "$INSTDIR\imageformats\qmng.dll"
	Delete "$INSTDIR\imageformats\qtga.dll"
	Delete "$INSTDIR\imageformats\qtiff.dll"
	Delete "$INSTDIR\imageformats\qwbmp.dll"
	Delete "$INSTDIR\imageformats\qwebp.dll"

	Delete "$desktop\PhotoQt.lnk"

	Delete "$INSTDIR\uninstall.exe"

	RMDir "$INSTDIR\platforms"
	RMDir "$INSTDIR\sqldrivers"
	RMDir "$INSTDIR\imageformats"
	RMDir "$INSTDIR"


	; Delete start menu enmtries
	Delete "$SMPROGRAMS\PhotoQt\PhotoQt.lnk"
	Delete "$SMPROGRAMS\PhotoQt\Uninstall.lnk"
	RMDir "$SMPROGRAMS\PhotoQt"


	; De-register file types

	Var /GLOBAL fileformats
	Var /GLOBAL fileformats_pdfps
	Var /GLOBAL fileformats_psdxcf
	ReadRegStr $fileformats HKCU "Software\PhotoQt" "fileformats"
	ReadRegStr $fileformats_pdfps HKCU "Software\PhotoQt" "fileformats_pdfps"
	ReadRegStr $fileformats_psdxcf HKCU "Software\PhotoQt" "fileformats_psdxcf"

	${If} $fileformats == "basic"
		!insertmacro UnRegisterExtensionCall ".bmp" "Microsoft Windows bitmap"
		!insertmacro UnRegisterExtensionCall ".bitmap" "Microsoft Windows bitmap"
		!insertmacro UnRegisterExtensionCall ".dds" "Direct Draw Surface"
		!insertmacro UnRegisterExtensionCall ".gif" "Graphics Interchange Format"
		!insertmacro UnRegisterExtensionCall ".tif" "Tagged Image File Format"
		!insertmacro UnRegisterExtensionCall ".tiff" "Tagged Image File Format"
		!insertmacro UnRegisterExtensionCall ".jpeg2000" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".jp2" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".jpc" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".j2k" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".jpf" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".jpx" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".jpm" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".mj2" "JPEG-2000 image"
		!insertmacro UnRegisterExtensionCall ".mng" "Multiple-image Network Graphics"
		!insertmacro UnRegisterExtensionCall ".ico" "Microsoft Icon"
		!insertmacro UnRegisterExtensionCall ".icns" "Microsoft Icon"
		!insertmacro UnRegisterExtensionCall ".jpeg" "JPEG image"
		!insertmacro UnRegisterExtensionCall ".jpg" "JPEG image"
		!insertmacro UnRegisterExtensionCall ".png" "Portable Network Graphics"
		!insertmacro UnRegisterExtensionCall ".pbm" "Portable bitmap format"
		!insertmacro UnRegisterExtensionCall ".pgm" "Portable graymap format"
		!insertmacro UnRegisterExtensionCall ".ppm" "Portable pixmap format"
		!insertmacro UnRegisterExtensionCall ".svg" "Scalable Vector Graphics"
		!insertmacro UnRegisterExtensionCall ".svgz" "Scalable Vector Graphics"
		!insertmacro UnRegisterExtensionCall ".xbm" "X Windows system bitmap"
		!insertmacro UnRegisterExtensionCall ".wbmp" "Wireless bitmap"
		!insertmacro UnRegisterExtensionCall ".webp" "Wireless bitmap"
		!insertmacro UnRegisterExtensionCall ".xpm" "X Windows system pixmap"
	${EndIf}

	${If} $fileformats == "advanced"
		!insertmacro UnRegisterExtensionCall ".avs" "AVS X image"
		!insertmacro UnRegisterExtensionCall ".x" "AVS X image"

		!insertmacro UnRegisterExtensionCall ".cals" "Continuous Acquisition and Life-cycle Support Type 1 image"
		!insertmacro UnRegisterExtensionCall ".cal" "Continuous Acquisition and Life-cycle Support Type 1 image"
		!insertmacro UnRegisterExtensionCall ".dcl" "Continuous Acquisition and Life-cycle Support Type 1 image"
		!insertmacro UnRegisterExtensionCall ".ras" "Continuous Acquisition and Life-cycle Support Type 1 image"

		!insertmacro UnRegisterExtensionCall ".cin" "Kodak Cineon"
		!insertmacro UnRegisterExtensionCall ".cut" "DR Halo"

		!insertmacro UnRegisterExtensionCall ".acr" "DICOM image"
		!insertmacro UnRegisterExtensionCall ".dcm" "DICOM image"
		!insertmacro UnRegisterExtensionCall ".dicom" "DICOM image"
		!insertmacro UnRegisterExtensionCall ".dic" "DICOM image"

		!insertmacro UnRegisterExtensionCall ".dcx" "ZSoft IBM PC multi-page Paintbrush image"
		!insertmacro UnRegisterExtensionCall ".dib" "Device Independent Bitmap"
		!insertmacro UnRegisterExtensionCall ".dpx" "Digital Moving Picture Exchange"

		!insertmacro UnRegisterExtensionCall ".fax" "Group 3 Fax"
		!insertmacro UnRegisterExtensionCall ".fits" "Flexible Image Transport System"
		!insertmacro UnRegisterExtensionCall ".fts" "Flexible Image Transport System"
		!insertmacro UnRegisterExtensionCall ".fit" "Flexible Image Transport System"
		!insertmacro UnRegisterExtensionCall ".fpx" "FlashPix Format"
		!insertmacro UnRegisterExtensionCall ".jng" "JPEG Network Graphics"
		!insertmacro UnRegisterExtensionCall ".mat" "MATLAT image format"
		!insertmacro UnRegisterExtensionCall ".miff" "Magick image file format"

		!insertmacro UnRegisterExtensionCall ".mono" "Bi-level bitmap in little-endian order"
		!insertmacro UnRegisterExtensionCall ".mtv" "MTV Raytracing image format"
		!insertmacro UnRegisterExtensionCall ".otb" "On-the-air bitmap"
		!insertmacro UnRegisterExtensionCall ".p7" "Xv's Visual Schnauzer thumbnail format"
		!insertmacro UnRegisterExtensionCall ".palm" "Palm pixmap"
		!insertmacro UnRegisterExtensionCall ".pam" "Portable Arbitrary Map format"
		!insertmacro UnRegisterExtensionCall ".pcd" "Photo CD"
		!insertmacro UnRegisterExtensionCall ".pcds" "Photo CD"
		!insertmacro UnRegisterExtensionCall ".pcx" "ZSoft IBM PC Paintbrush file"
		!insertmacro UnRegisterExtensionCall ".pdb" "Palm Database ImageViewer format"

		!insertmacro UnRegisterExtensionCall ".pict" "Apple Macintosh QuickDraw/PICT file"
		!insertmacro UnRegisterExtensionCall ".pct" "Apple Macintosh QuickDraw/PICT file"
		!insertmacro UnRegisterExtensionCall ".pic" "Apple Macintosh QuickDraw/PICT file"
		!insertmacro UnRegisterExtensionCall ".pix" "Alias/Wavefront RLE image format"
		!insertmacro UnRegisterExtensionCall ".pal" "Alias/Wavefront RLE image format"
		!insertmacro UnRegisterExtensionCall ".pnm" "Portable anymap"

		!insertmacro UnRegisterExtensionCall ".ptif" "Pyramid encoded TIFF"
		!insertmacro UnRegisterExtensionCall ".ptiff" "Pyramid encoded TIFF"
		!insertmacro UnRegisterExtensionCall ".sfw" "Seattle File Works image"
		!insertmacro UnRegisterExtensionCall ".sgi" "Irix RGB image"
		!insertmacro UnRegisterExtensionCall ".sun" "SUN Rasterfile"
		!insertmacro UnRegisterExtensionCall ".tga" "Truevision Targe image"
		!insertmacro UnRegisterExtensionCall ".vicar" "VICAR rasterfile format"
		!insertmacro UnRegisterExtensionCall ".viff" "Khoros Visualization image file format"

		!insertmacro UnRegisterExtensionCall ".wpg" "Word Perfect Graphics file"
		!insertmacro UnRegisterExtensionCall ".xwd" "X Windows system window dump"
	${EndIf}

	${If} $fileformats_pdfps == "registered"
		!insertmacro UnRegisterExtensionCall ".epdf" "Encapsulated PDF"
		!insertmacro UnRegisterExtensionCall ".epi" "Encapsulated PostScript Interchange format"
		!insertmacro UnRegisterExtensionCall ".epsi" "Encapsulated PostScript Interchange format"
		!insertmacro UnRegisterExtensionCall ".eps" "Encapsulated PostScript"
		!insertmacro UnRegisterExtensionCall ".epsf" "Encapsulated PostScript"
		!insertmacro UnRegisterExtensionCall ".eps2" "Level II Encapsulated PostScript"
		!insertmacro UnRegisterExtensionCall ".eps3" "Level III Encapsulated PostScript"
		!insertmacro UnRegisterExtensionCall ".ept" "Encapsulated PostScript Interchange format (TIFF preview)"
		!insertmacro UnRegisterExtensionCall ".pdf" "Portable Document Format"
		!insertmacro UnRegisterExtensionCall ".ps" "PostScript"
		!insertmacro UnRegisterExtensionCall ".ps2" "Level II PostScript"
		!insertmacro UnRegisterExtensionCall ".ps3" "Level III PostScript"
	${EndIf}

	${If} $fileformats_psdxcf == "registered"
		!insertmacro UnRegisterExtensionCall ".psb" "Large Photoshop Document"
		!insertmacro UnRegisterExtensionCall ".psd" "Photoshop Document"
		!insertmacro UnRegisterExtensionCall ".xcf" "Gimp image"
	${EndIf}

	; Update icons
	System::Call 'shell32.dll::SHChangeNotify(i, i, i, i) v (0x08000000, 0, 0, 0)'

	; Delete registry key
	DeleteRegValue HKLM "SOFTWARE\PhotoQt" "fileformats"
	DeleteRegValue HKLM "SOFTWARE\PhotoQt" "fileformats_pdfps"
	DeleteRegValue HKLM "SOFTWARE\PhotoQt" "fileformats_psdxcf"
	DeleteRegKey /ifempty HKLM "Software\PhotoQt"


SectionEnd
