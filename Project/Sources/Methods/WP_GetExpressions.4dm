//%attributes = {"invisible":true}

C_TEXT:C284($1)
C_LONGINT:C283($2;$3)
C_POINTER:C301($4;$5;$6;$7)

C_TEXT:C284($areaName)
C_LONGINT:C283($start;$end)
C_POINTER:C301($ptrLabel;$ptrURL;$ptrTrueExpression;$ptrVirtualExpression)

C_OBJECT:C1216($oCurrent)
C_TEXT:C284($label;$URL)
C_LONGINT:C283($start;$end)


C_TEXT:C284($memoExpression;$virtualExpression;$trueExpression)

$ptrLabel:=OBJECT Get pointer:C1124(Object named:K67:5;"URLlabel")
If (Not:C34(Is nil pointer:C315($ptrLabel)))
	$ptrLabel->:=""
End if 

$ptrURL:=OBJECT Get pointer:C1124(Object named:K67:5;"URLurl")
If (Not:C34(Is nil pointer:C315($ptrURL)))
	$ptrURL->:=""
End if 

$ptrTrueExpression:=OBJECT Get pointer:C1124(Object named:K67:5;"TrueExpression")
If (Not:C34(Is nil pointer:C315($ptrTrueExpression)))
	$ptrTrueExpression->:=""
End if 

$ptrVirtualExpression:=OBJECT Get pointer:C1124(Object named:K67:5;"VirtualExpression")
If (Not:C34(Is nil pointer:C315($ptrVirtualExpression)))
	$ptrVirtualExpression->:=""
End if 


If (areaName#"")
	
	If (Count parameters:C259=0)  // component context)
		
		If (Not:C34((Is nil pointer:C315($ptrLabel)) | (Is nil pointer:C315($ptrURL)) | (Is nil pointer:C315($ptrTrueExpression)) | (Is nil pointer:C315($ptrVirtualExpression))))
			
			$start:=Form:C1466.selection[wk start:K81:87]
			$end:=Form:C1466.selection[wk end:K81:88]
			
			CALL FORM:C1391(Current form window:C827;Current method name:C684;areaName;$start;$end;$ptrLabel;$ptrURL;$ptrTrueExpression;$ptrVirtualExpression)
			
		End if 
		
	Else   // host database context
		
		$areaName:=$1
		$start:=$2
		$end:=$3
		$ptrLabel:=$4
		$ptrURL:=$5
		$ptrTrueExpression:=$6
		$ptrVirtualExpression:=$7
		
		ST GET URL:C1288(*;$areaName;$label;$URL;$start;$end)
		
		$ptrLabel->:=$label
		$ptrURL->:=$URL
		
		$memoExpression:=ST Get expression:C1287(*;$areaName;$start;$end)
		$virtualExpression:=Parse formula:C1576($memoExpression;Formula out with virtual structure:K88:2)
		$trueExpression:=Parse formula:C1576($virtualExpression;Formula in with virtual structure:K88:1)
		
		If ($memoExpression=$trueExpression)
			
			$ptrTrueExpression->:=$trueExpression
			$ptrVirtualExpression->:=$virtualExpression  //display expression using virtual structure (RL palettes only)
			
		Else 
			
			$ptrTrueExpression->:=""
			$ptrVirtualExpression->:=""
			
		End if 
		
	End if 
	
End if 



