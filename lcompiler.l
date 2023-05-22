%{
#include "scompiler.tab.h"
%}
incrementador "++"|"--"
%%
"$"                     {return FLN;}
"ent"                   {return ENT;}
"txt"                   {return TXT;}
"dec"                   {return DEC;}
"con"                   {return CON;}
"nd"                    {return ND;}
"pr"                    {return PR;}
"["                     {return APC;}
"]"                     {return CPC;}
":"                     {return ASI;}
,			            {return COM;}
";"                     {return PYC;}
"{"                     {return ACO;}
"}"                     {return CCO;}
"<"                     {return MEN;}
"<="                    {return MEI;}
">"                     {return MAY;}
">="                    {return MAI;}
"="                     {return IGU;}
"=!"                    {return NIG;}
"&"                     {return Y;}
"|"                     {return O;}
{incrementador}         {return INC;}
"mt"                    {return MT;}
"sikas"                 {return SIK;}
"nokas"                 {return NOK;}
"dev"                   {return DEV;}
\+			            {return SUM;}
\*			            {return MUL;}
\-			            {return RES;}
\/			            {return DIV;}
"it"                    {return IT;}
"at"                    {return AT;}
[A-Za-z0-9]+		{return VTX;}
[ \t\n]                 {/*Se ignoran los espacios*/}
.			{printf("Error léxico: %s\n", yytext);}
%%
int yywrap(){return 1;}
