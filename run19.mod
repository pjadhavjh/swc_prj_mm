$PROBLEM    COVCORR
$INPUT      ID TIME DV OBS ET1 ET2 ET3 ET4 ET5
$DATA       data6.csv IGNORE=@ IGN(OBS.GE.4)
$PRED

CL=THETA(1)*EXP(ETA(1))
V =THETA(2)*EXP(ETA(2))
CONC=100/V*EXP(-CL/V*TIME)
Y=LOG(CONC)+EPS(1)

$THETA  (0,10) ; 1 TVCL
$THETA  (0,100) ; 1 TVV
$OMEGA  BLOCK(2) 0.1 .01 .1
$SIGMA .2
$SIM (12345)
$EST METH=1 MAX=9999
$COV
$TABLE ID TIME DV OBS ETA1 ETA2  CL V CONC ONEHEADER NOPRINT FILE=mytab19

