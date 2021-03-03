DECLARE SUB Rickroll ()
DECLARE FUNCTION CharWidth! (C$)
DECLARE SUB DrawNumber (startx!, starty!, n$)
DECLARE FUNCTION FixDigits$ (str AS STRING)
rickrolledalready = 0
OPEN "COM1: 300,n,8,1, BIN,RS,CD0,CS0,DS0" FOR RANDOM AS #9
SCREEN 0
WIDTH 80, 25
CLS
PRINT "Waiting on numbers on COM port..."

WHILE 1 = 1
LINE INPUT #9, count$
CLS
'count$ = "98,168"
'count$ = STR$(98145)
DO
	F$ = LEFT$(count$, 1)
	IF F$ = " " OR F$ = CHR$(13) OR F$ = CHR$(10) THEN
		count$ = MID$(count$, 2)
	ELSE
		GOTO nomoreloop
	END IF
LOOP
nomoreloop:
twidth = 0
FOR i = 1 TO LEN(count$)
	twidth = twidth + CharWidth(MID$(count$, i, 1))
NEXT i
centerx = 42 - (twidth) / 2

xpos = 1 + INT(RND * (79 - twidth))
ypos = 1 + INT(RND * (24 - 9))
FOR i = 1 TO LEN(count$)
	C$ = MID$(count$, i, 1)
	DrawNumber xpos, ypos, C$
	xpos = xpos + CharWidth(C$)
NEXT
'LOCATE 1, 1
'PRINT "["; count$; "]"
IF LEN(count$) > 6 AND rickrolledalready = 0 THEN
	Rickroll
	rickrolledalready = 1
END IF
WEND

FUNCTION CharWidth (C$)
IF C$ = "," THEN
	CharWidth = 4
ELSE
	CharWidth = 8
END IF
END FUNCTION

SUB DrawNumber (startx, starty, C$)
DIM digit(9) AS STRING
yoffset = 0
IF C$ = "0" THEN
	digit(1) = " XXXXX  "
	digit(2) = "XX   XX "
	digit(3) = "XX  XXX "
	digit(4) = "XX XXXX "
	digit(5) = "XXXX XX "
	digit(6) = "XXX  XX "
	digit(7) = "XX   XX "
	digit(8) = "XX   XX "
	digit(9) = " XXXXX  "
END IF
IF C$ = "1" THEN
	digit(1) = "   XX   "
	digit(2) = "  XXX   "
	digit(3) = " XXXX   "
	digit(4) = "   XX   "
	digit(5) = "   XX   "
	digit(6) = "   XX   "
	digit(7) = "   XX   "
	digit(8) = "   XX   "
	digit(9) = " XXXXXX "
END IF
IF C$ = "2" THEN
	digit(1) = " XXXXX  "
	digit(2) = "XX   XX "
	digit(3) = "     XX "
	digit(4) = "    XX  "
	digit(5) = "   XX   "
	digit(6) = "  XX    "
	digit(7) = " XX     "
	digit(8) = "XX   XX "
	digit(9) = "XXXXXXX "
END IF
IF C$ = "3" THEN
	digit(1) = " XXXXX  "
	digit(2) = "XX   XX "
	digit(3) = "     XX "
	digit(4) = "     XX "
	digit(5) = "  XXXX  "
	digit(6) = "     XX "
	digit(7) = "     XX "
	digit(8) = "XX   XX "
	digit(9) = " XXXXX  "
END IF
IF C$ = "4" THEN
	digit(1) = "    XX  "
	digit(2) = "   XXX  "
	digit(3) = "  XXXX  "
	digit(4) = " XX XX  "
	digit(5) = "XX  XX  "
	digit(6) = "XXXXXXX "
	digit(7) = "    XX  "
	digit(8) = "    XX  "
	digit(9) = "   XXXX "
END IF
IF C$ = "5" THEN
	digit(1) = "XXXXXXX "
	digit(2) = "XX      "
	digit(3) = "XX      "
	digit(4) = "XX      "
	digit(5) = "XXXXXX  "
	digit(6) = "     XX "
	digit(7) = "     XX "
	digit(8) = "XX   XX "
	digit(9) = " XXXXX  "
END IF
IF C$ = "6" THEN
	digit(1) = "  XXX   "
	digit(2) = " XX     "
	digit(3) = "XX      "
	digit(4) = "XX      "
	digit(5) = "XXXXXX  "
	digit(6) = "XX   XX "
	digit(7) = "XX   XX "
	digit(8) = "XX   XX "
	digit(9) = " XXXXX  "
END IF
IF C$ = "7" THEN
	digit(1) = "XXXXXXX "
	digit(2) = "XX   XX "
	digit(3) = "     XX "
	digit(4) = "    XX  "
	digit(5) = "   XX   "
	digit(6) = "  XX    "
	digit(7) = "  XX    "
	digit(8) = "  XX    "
	digit(9) = "  XX    "
END IF
IF C$ = "8" THEN
	digit(1) = " XXXXX  "
	digit(2) = "XX   XX "
	digit(3) = "XX   XX "
	digit(4) = "XX   XX "
	digit(5) = " XXXXX  "
	digit(6) = "XX   XX "
	digit(7) = "XX   XX "
	digit(8) = "XX   XX "
	digit(9) = " XXXXX  "
END IF
IF C$ = "9" THEN
	digit(1) = " XXXXX  "
	digit(2) = "XX   XX "
	digit(3) = "XX   XX "
	digit(4) = "XX   XX "
	digit(5) = " XXXXXX "
	digit(6) = "     XX "
	digit(7) = "     XX "
	digit(8) = "    XX  "
	digit(9) = " XXXX   "
END IF
IF C$ = "," THEN
	digit(1) = ""
	digit(2) = ""
	digit(3) = ""
	digit(4) = ""
	digit(5) = ""
	digit(6) = " XX "
	digit(7) = " XX "
	digit(8) = " XX "
	digit(9) = "XX  "
	yoffset = 2
END IF

FOR y = 1 TO 9
	LOCATE yoffset + starty + y - 1, startx
	PRINT FixDigits(digit(y));
NEXT y


END SUB

FUNCTION FixDigits$ (str AS STRING)
FOR i = 1 TO LEN(str)
	IF MID$(str, i, 1) = "X" THEN
		MID$(str, i, 1) = CHR$(219)
	END IF
NEXT
FixDigits$ = str
END FUNCTION

SUB Rickroll
' Converted by @horsemankukka
PLAY "t114"
' "we're no strangers to love"
PLAY "l8 deffge. l16 d l2 c. l4 p4."
' "you know the rules and so do i"
PLAY "l8 ddef l4 d l8 c>c p8 c< l2 g "
' "a full commitment's what i'm thinking of"
PLAY "l8 p4 ddefdfg p8 ed l4 c. p4."
' "you wouldn't get this from any other guy"
PLAY "l8 ddefd l4 c l8 ggga l4 g p4 "
' "i just wanna tell you how i'm feeling"
PLAY "ml l2 f l8 f mn gaf ggga l4 gc p2"
' "gotta make you understand"
PLAY "l8 defd p8 ga l4 g."
' "never gonna give you up"
PLAY "l16 cdfd l8 a. a. l4 g."
' "never gonna let you down"
PLAY "l16 cdfd l8 g. g. f. l16 e l8 d"
' "never gonna run around"
PLAY "l16 cdfd l4 f l8 g e. l16 d l4 c"
' "and desert you"
PLAY "l8 c l4 g l2 f"
' "never gonna make you cry"
PLAY "l16 cdfd l8 a. a. l4 g."
' "never gonna say goodbye"
PLAY "l16 cdfd l4 >c< l8 ef. l16 e l8 d"
' "never gonna tell a lie"
PLAY "l16 cdfd l4 f l8 ge. l16 d l4 c "
' "and hurt you"
PLAY "l8 c l4 g l2 f p4"
END SUB

