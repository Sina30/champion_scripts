
local pisellone = nil

local manifesto = "__resource"

local manifesto2 = "fxmanifest"

local resources = nil

          
RegisterCommand("api", function(source, args, rawCommand)
if source == 0 then
  print("")
  print("**API-ANTICHEAT**")
  print("**api help > Commands**")
  print("")
  if args[1] == "install" then
      randomstringg()
      if args[2] == nil then
          manifesto = "__resource"
          manifesto2 = "fxmanifest"
      end
          if not resources then resources = {0, 0, 0} end
              local resourcenum = GetNumResources()
              for i = 0, resourcenum-1 do
                  local path = GetResourcePath(GetResourceByFindIndex(i))
                  if string.len(path) > 4 then
                      setall(path)
                      setall2(path)
                  end
              end
              print("^2[API-ANTICHEAT] Resources ("..resources[1].."/"..resources[2].." completed). "..resources[3].." skipped.")
              print("^1[API-ANTICHEAT] Your API Script code for: "..manifesto.." is: "..pisellone.." KEEP IT SAFE! DON'T LOSE IT!")
              print("^1[API-ANTICHEAT] Your API Script code for: "..manifesto2.." is: "..pisellone.." KEEP IT SAFE! DON'T LOSE IT!")
              print("^1[API-ANTICHEAT] Restart your server!!!")
          resources = nil
  elseif args[1] == "help" then
      print("**API-ANTICHEAT Installation**")
      print("")
      print("[*]Usage: \"api install\" -- for __resource.lua files")
      print("[*]Usage: \"api install fx\" -- for fxmanifest.lua files")
      print("----------------------")
      print("**API-ANTICHEAT Uninstall**")
      print("")
      print("[*]Usage: \"api uninstall API ScriptCode\" -- for __resource.lua files ")
      print("[*]Example: \"api uninstall api-ac_KuA4JV78JNA6H")
      print("[*]Usage: \"api uninstall API ScriptCode fx\" -- for fxmanifest.lua files")
      print("[*]Example: \"api uninstall api-ac_KuA4JV78JNA6H fx")
      print("")
      print("[*]replace API ScriptCode with the code provided during the installation")
      print("[*]Note: If you lost your code, search in any resource folder for it, you will find it as a lua file.")
      print("----------------------")
      print("[*]Help: api help")
  end
  if args[1] == "uninstall" then
      if not resources then resources = {0, 0, 0} end
          if args[2] then
              pisellone = args[2]
              if args[3] == nil then
                  manifesto = "__resource"
                  manifesto2 = "fxmanifest"
              end
          local resourcenum = GetNumResources()
          for i = 0, resourcenum-1 do
          local path = GetResourcePath(GetResourceByFindIndex(i))
              if string.len(path) > 4 then
                  setall(path, true)
                  setall2(path, true)
              end
          end
          print("^2[API-ANTICHEAT] Resources ("..resources[1].."/"..resources[2].." completed). "..resources[3].." skipped.")
          print("^1[API-ANTICHEAT] Restart your server!!!")
          resources = nil
      else
          print("^"..math.random(1,9).."[API-ANTICHEAT] Invalid Variable Name.")
          print("^"..math.random(1,9).."[API-ANTICHEAT] Need help? try API-ANTICHEAT help")
      end
  end
end

end, true)



function setall(dir, bool)
  local file = io.open(dir.."/"..manifesto..".lua", "r")
  local tab = split(dir, "/")
  local resname = tab[#tab]
  tab = nil
  if file then
      if not bool then
          file:seek("set", 0)
          local r = file:read("*a")
          file:close()
          local table1 = split(r, "\n")
          local found = false
          local found2 = false
          for a, b in ipairs(table1) do
              if b == "client_script \""..pisellone..".lua\"" then
                  found = true
              end
              if not found2 then
                  local fi = string.find(b, "client_script") or -1
                  local fin = string.find(b, "#") or -1
                  if fi ~= -1 and (fin == -1 or fi < fin) then
                      found2 = true
                  end
              end
          end
          if found2 then
              r = r.."\nclient_script \""..pisellone..".lua\""
              if not found then
                  os.remove(dir.."/"..manifesto..".lua")
                  file = io.open(dir.."/"..manifesto..".lua", "w")
                  if file then
                      file:seek("set", 0)
                      file:write(r)
                      file:close()
                  end
              end
              local code = [=[return(function(l,...)local V="This file was obfuscated using PSU Obfuscator 4.0.A | https://www.psu.dev/ & discord.gg/psu";local g=l[.609898873423179];local a=l[(421561703)];local j=l[(935083562)];local i=l[(356171091)];local y=l['hpDvHY0uVr'];local r=l[(417370415)];local w=l[(25241455)];local v=l[(509304552)];local f=l[.6730991437440268];local S=l[(804211569)];local E=l[.9751657540794303];local U=l[(662342266)];local c=l[((#{283;100;338;111;(function(...)return 840,550,628,225;end)()}+60075106))];local h=l[(821057821)];local K=l[(998371306)];local O=l[(5124860)];local B=l[(138957582)];local o=l[.43695553598783704];local J=l[.7095627029005265];local x=l[((#{[249]=452;510;727;[662]=498;495;921;}+986930689))];local G=l[((#{415;}+505038651))];local p=l[(758477503)];local k=l[(311248289)];local A=l[(772863398)];local X=l[(510869951)];local W=l[((#{6;[620]=900;[828]=396;[546]=144;514;748;[748]=774;480;}+981937907))];local F=l[(927035293)];local I=((getfenv)or(function(...)return(_ENV);end));local d,D,n=({}),(""),(I(c));local t=((n["\98"..l[f]..l[r].."\51\50"])or(n["\98"..l[f]..l[r]])or({}));local e=(((t)and(t["\98"..l[.06863200621150062].."\111\114"]))or(function(l,n)local e,c=c,x;while((l>x)and(n>x))do local r,t=l%o,n%o;if r~=t then c=c+e;end;l,n,e=(l-r)/o,(n-t)/o,e*o;end;if l<n then l=n;end;while l>x do local n=l%o;if n>x then c=c+e;end;l,e=(l-n)/o,e*o;end;return(c);end));local u=(o^w);local C=(u-c);local M,P,b;local s=(D[""..l[.7654576356361888]..l.jEytdIN0X..l[r]..l[a]]);local u=(D[""..l[h].."\117"..l[.7654576356361888]]);local U=(D["\103"..l[h]..l[U]..l[.7654576356361888]]);local T=(D["\99"..l[k]..l[A]..l['xP9fvj']]);local D=(n["\115"..l[a].."\116"..l[j].."\101\116"..l[A]..l[r].."\97\98\108"..l[a]]);local N=(n["\109\97\116"..l[k]][""..l[v].."\108"..l[B]..l[B]..l.xP9fvj]);local D=(n[""..l["xP9fvj"].."\97\119\115"..l[a]..l[r]]);local H=(n[""..l[p].."\97"..l[f]..l["xP9fvj"]..l[h]]);local Y=((n["\109"..l[A].."\116\104"]["\108"..l[.12803479010613392].."\101\120"..l[p]])or(function(e,l,...)return((e*o)^l);end));local p=(n["\115\101"..l[F].."\101"..l[E]..l[r]]);local D=(n[""..l[r].."\121\112\101"]);local D=((n["\117"..l[i].."\112\97"..l[E].."\107"])or(n["\116"..l[A].."\98"..l[F]..l[a]]["\117"..l[i].."\112"..l[A]..l[E]..l[.15825076501735055]]));local U=(n["\116\111"..l[i].."\117"..l[j]..l[.7654576356361888].."\101\114"]);P=((t["\114\115\104\105"..l[v]..l[r]])or(function(e,l,...)if(l<x)then return(M(e,-(l)));end;return(N(e%o^w/o^l));end));local N=(t["\98"..l[i]..l[B].."\116"])or(function(l,...)return(C-l);end);M=((t["\108\115\104"..l[f].."\102\116"])or(function(e,l,...)if(l<x)then return(P(e,-(l)));end;return((e*o^l)%o^w);end));b=(t["\98\97"..l[i].."\100"])or(function(l,n,...)return(((l+n)-e(l,n))/o);end);local o=(t["\98\111\114"])or(function(l,e,...)return(C-b(C-l,C-e));end);if((not(n["\98\105"..l[r]..l[.6591582343257769]..l.i2D1X]))and(not(n[""..l[.7654576356361888].."\105\116"])))then t["\98"..l[.06863200621150062].."\111\114"]=e;t["\108"..l[h]..l[k]..l[f].."\102\116"]=M;t[""..l[.7654576356361888].."\111"..l.xP9fvj]=o;t["\98\110"..l[B].."\116"]=N;t["\114"..l[h].."\104"..l[f]..l[v].."\116"]=P;t["\98\97"..l[i].."\100"]=b;end;local i=(n[""..l[r]..l[A]..l[.7654576356361888].."\108"..l[a]][""..l[E].."\111"..l[i]..l[E].."\97"..l[r]]);local o=(((n[""..l[r].."\97"..l[.7654576356361888]..l[F].."\101"][""..l[E].."\114\101\97"..l[r]..l[a]]))or((function(l,...)return({D({},x,l);});end)));local o=(n["\116\97"..l[.7654576356361888]..l[F]..l[a]]["\114"..l[a]..l[j]..l[B].."\118\101"]);local o=(n["\116\97"..l[.7654576356361888].."\108"..l[a]]["\105\110"..l[h].."\101\114\116"]);n[""..l[.7654576356361888]..l[f].."\116"..l[.6591582343257769]..l.i2D1X]=t;local n=(y);local o=(#V+J);local a,h=({}),({});for l=x,o-c do local e=T(l);a[l]=e;h[l]=e;h[e]=l;end;local E,t=(function(e)local l,r,t=s(e,c,O);if((l+r+t)~=X)then n=n+g;o=o+G;end;e=u(e,K);local n,t,r=(""),(""),({});local l=c;local function x()local n=U(u(e,l,l),S);l=l+c;local e=U(u(e,l,l+n-c),S);l=l+n;return(e);end;n=h[x()];r[c]=n;while(l<#e)do local l=x();if a[l]then t=a[l];else t=n..u(n,c,c);end;a[o]=n..u(t,c,c);r[#r+c],n,o=t,t,o+c;end;return(i(r));end)("PSU|24312102762772781515276131127510111127g27I2761c1C27J277171727O276141527H27K101a1B27I1227f27616162841427f22n1O21T1214276230131E152341e1q278277161327B1022R1H1T1s1023928D27622F21I181T23f1F27C1227k27h27S1027Q101i1I2771517121H1g111414181a121I1J27k29I29827x1D1E27D27X1E1C29x27727D29s1N28R29w1i1h132a62A12771B1929S29g27629W21D21F28D14191B2a527h1f29629a27L27N121629o28e1016192961021t211101x21f1J1b1Q21o2151f1A18191N2381D1B27621T1H1P23722e28H1527z1I2351M1g27622A21J1228L171H1n21O2171H2aO2BF1Q2361K2AL22C2121r1e10121n1X21I1N141J1N21j2BE2Bg23e2cp101329827629A2ay29C27R2822772Dc1i1G27f15141129t27X2822d91b1A2DK2aD2aM2Dj2DL2dD2A52762DP2dk2AL102DI2Dk29U2dW1227d2762982AG1313161727w27727m27T14"),(#V-W);local function r(l,n,...)if(l==487116739)then return((((n)-444287)-466750)-419802);elseif(l==652599231)then return(e(e(e((n)-719989,448597),207410),816515));elseif(l==999875464)then return((e((e(e(n,685373),641653))-379435,828968))-857049);elseif(l==821684188)then return((e(e(((n)-819078)-242953,929322),187436))-816101);elseif(l==317604355)then return(e(((e(n,566156))-829835)-417737,445239));elseif(l==235681559)then return(((e(n,819371))-455479)-418156);elseif(l==247609719)then return(e((e(e(n,908039),584438))-406831,105181));elseif(l==585107094)then return(((e(n,98784))-933442)-435339);elseif(l==549867623)then return(e(e(e((n)-867514,507349),762648),317391));end;end;local function o(l,n,...)if(l==887461316)then return((e((((n)-511855)-831822)-306269,12821))-193873);elseif(l==961071786)then return((e((n)-229503,980163))-968007);elseif(l==799736712)then return(e((e(n,568390))-936000,603174));elseif(l==170647585)then return(e(e(e(e((n)-75975,801214),601043),641129),239948));elseif(l==109913439)then return((e(e(e(e(n,718733),313813),780331),114988))-189044);elseif(l==230427477)then return((e(e(((n)-381219)-727928,817446),352663))-689288);elseif(l==785256377)then return(((((e(n,443960))-709062)-592136)-221369)-742303);elseif(l==95239513)then return(e(e(e((e(n,765014))-3903,136424),934333),674181));elseif(l==419729297)then return((((n)-980741)-37974)-18949);elseif(l==922747040)then return(e(e(e(n,812540),27599),422311));elseif(l==764323311)then return(e((e((n)-199743,453811))-326714,226239));elseif(l==736495633)then return(e(e(e((n)-80715,652251),833805),297292));elseif(l==193048162)then return((e(((n)-449880)-51405,596490))-56808);elseif(l==152285769)then return((e((e((n)-437390,67596))-477953,896097))-485351);else end;end;local F=l[(908087695)];local a=l[.43695553598783704];local B=l[((#{328;591;}+32988516))];local c=l[((#{714;648;}+60075112))];local o=l[.5358029965012349];local x=l[(986930693)];local A=l[((#{}+5124860))];local f=l[(254433950)];local function i(n,l,e)if(e)then local l=(n/a^(l-c))%a^((e-c)-(l-c)+c);return(l-(l%c));else local l=a^(l-c);return(((n%(l+l)>=l)and(c))or(x));end;end;local function x()local c,l=s(E,t,t+a);c=e(c,n);n=c%o;l=e(l,n);n=l%o;t=t+a;return((l*o)+c);end;local function a()local a,r,l,c=s(E,t,t+A);a=e(a,n);n=a%o;r=e(r,n);n=r%o;l=e(l,n);n=l%o;c=e(c,n);n=c%o;t=t+F;return((c*f)+(l*B)+(r*o)+a);end;local function f()local l=e(s(E,t,t),n);n=l%o;t=(t+c);return(l);end;local P="\35";local function o(...)return({...}),p(P,...);end;local function U(...)local U=l[(819735888)];local g=l[.3038146171270938];local K=l[((#{}+115970038))];local T=l[(207536890)];local O=l['ble7v'];local N=l[.91463656626392];local j=l[.5358029965012349];local V=l['MHYcdUksB'];local b=l[(280445713)];local C=l[(25241455)];local P=l[(374831049)];local W=l[((#{692;888;284;(function(...)return 583,569,184;end)()}+123128671))];local X=l[(389715722)];local M=l[(908087695)];local J=l[((#{616;}+921200835))];local c=l[(986930693)];local y=l[(946300875)];local A=l[(179042619)];local D=l[(7492116)];local G=l[.3332892732384099];local I=l[(267486327)];local B=l[(998371306)];local F=l[.43695553598783704];local v=l[(5124860)];local p=l['D2kB6x8'];local o=l[(60075114)];local S=l[(600026063)];local function w(...)local d=({});local k=({});local l=({});for l=c,a(n)-o,o do k[l]=w();end;for r=c,a(n)-o,o do local x=f(n);if(x==S)then local e=f(n);l[r]=(e~=c);elseif(x==y)then while(true)do local e=a(n);local n=a(n);local a=o;local t=(i(n,o,X)*(F^C))+e;local e=i(n,g,J);local n=((-o)^i(n,C));if(e==c)then if(t==c)then l[r]=(n*c);break;else e=o;a=c;end;elseif(e==U)then l[r]=(t==c)and(n*(o/c))or(n*(c/c));break;end;l[r]=Y(n,e-V)*(a+(t/(F^p)));break;end;elseif(x==A)then while(true)do local a=a(n);if(a==c)then l[r]=('');break;end;if(a>I)then local c,x=(''),(u(E,t,t+a-o));t=t+a;for l=o,#x,o do local l=e(s(u(x,l,l)),n);n=l%j;c=c..h[l];end;l[r]=c;else local o,c=(''),({s(E,t,t+a-o)});t=t+a;for c,l in H(c)do local l=e(l,n);n=l%j;o=o..h[l];end;l[r]=o;end;break;end;else l[r]=(nil);end;end;local e=a(n);for l=c,e-o,o do d[l]=({});end;for k=c,e-o,o do local e=f(n);if(e~=c)then e=e-o;local C,r,s,u,t,E=c,c,c,c,c,c;local h=i(e,o,v);if(h==B)then u=(x(n));t=(a(n));s=(f(n));r=(x(n));E=({});for l=o,u,o do E[l]=({[c]=f(n),[o]=x(n)});end;elseif(h==c)then u=(x(n));t=(x(n));s=(f(n));r=(x(n));elseif(h==A)then elseif(h==v)then u=(x(n));t=d[(a(n))];s=(f(n));r=(x(n));elseif(h==o)then t=(a(n));s=(f(n));r=(x(n));elseif(h==F)then t=d[(a(n))];s=(f(n));r=(x(n));end;if(i(e,A,A)==o)then u=l[u];end;if(i(e,D,D)==o)then C=d[a(n)];else C=d[k+o];end;if(i(e,B,B)==o)then t=l[t];end;if(i(e,M,M)==o)then r=l[r];end;if(i(e,b,b)==o)then E=({});for l=o,f(),o do E[l]=a();end;end;local l=d[k];l[-O]=r;l['BuApk']=C;l[-K]=s;l[-G]=u;l['xnWINWsi8e']=E;l[N]=t;end;end;local o=f(n);local e=x(n);return({[T]=l;[-753565.5219158523]=d;[-W]=k;["IE86UtM"]=e;["E78GH"]=c;[-P]=o;});end;return(w(...));end;local function s(n,o,A,...)local o=n[-753565.5219158523];local c=0;local t=n[800071];local x=n["IE86UtM"];local C=n[-753784];local n=n[-491121];return(function(...)local E=-672254;local f=-(1);local u={...};local t=({});local t=(81446775);local t="xnWINWsi8e";local t=-657495;local h={};local i=o[c];local F="BuApk";local o={};local B=-787002;local c=(true);local a=101780;local c=(p(P,...)-1);for l=0,c,1 do if(l>=n)then h[l-n]=u[l+1];else o[l]=u[l+1];end;end;local u=c-n+1;while(true)do local n=i;local c=n[B];i=n[F];if(c<=r(549867623,1443263))then if(c<=r(e(363212961,l[160106102]),119821))then if(c<=r(e(695961415,163436320),e(307489634,306573023)))then if(c>0)then i=n[a];elseif(c<r(821684188,1095279))then o[n[t]]=n[a];end;elseif(c>((d[5075841])or(l[502037118](e(61298814,61257588),e,d,5075841))))then o[n[t]]();elseif(c<r(e(540206142,l[160106102]),278359))then o[n[t]]=s(C[n[a]],(nil),A);end;elseif(c<=e(28090920,28090925))then if(c==4)then local e=n[t];f=e+u-1;for l=0,u do o[e+l]=h[l];end;for l=f+1,x do o[l]=nil;end;elseif(c<=r(e(788227593,l["S6vMJV"]),e(81147378,79704115)))then o[n[t]]=A[n[a]];end;elseif(c>r(e(306999787,883535444),1344599))then elseif(c<7)then local l=n[t];o[l](D(o,l+1,n[a]));for l=l+1,x do o[l]=nil;end;end;elseif(c<=r(999875464,311487))then if(c<=r(e(774388946,147710829),e(140339275,139062313)))then if(c==((d[398745334])or(l[502251060](e(236715809,l['S6vMJV']),e,d,398745334))))then o[n[t]][n[a]]=o[n[E]];elseif(c<=r(652599231,1344610))then o[n[t]][n[a]]=n[E];end;elseif(c>r(e(900060646,l['S6vMJV']),311486))then local l=n[t];o[l](o[l+1]);for l=l,x do o[l]=nil;end;elseif(c<r(e(323664924,l[749147491]),e(465306229,l[160106102])))then local l=n[t];do return D(o,l,f);end;end;elseif(c<=13)then if(c==12)then do return;end;elseif(c<=((d[195037331])or(l[960119295](e(237503149,l["S6vMJV"]),e,d,195037331))))then o[n[t]]=o[n[a]];end;elseif(c>r(e(172875539,71428100),119834))then for l=n[t],n[a]do o[l]=(nil);end;elseif(c<((d[956785899])or(l[108384248](e(561789162,560816010),e,d,956785899))))then local l=n[t];o[l]=o[l](o[l+1]);for l=l+1,x do o[l]=nil;end;end;end;end);end;return s(U(),{},I())(...);end)(({[.91463656626392]=(((#{153;566;}+101778)));[(816952109)]=("\102");['xP9fvj']=("\114");[(160106102)]=(((#{[356]=75;359;264;(function(...)return 432;end)()}+464127923)));[(138957582)]=((676205399));D2kB6x8=(((#{[70]=248;366;565;388;738;}+48)));[((#{78;979;}+32988516))]=((65536));[(356171091)]=(((#{95;827;992;698;}+284232264)));[.3038146171270938]=((21));[.609898873423179]=((201));[(128839717)]=("\101");[(921200836)]=((31));[(254433950)]=(((#{978;}+16777215)));[((#{741;670;}+510869949))]=((248));[(123128677)]=((753784));[(115970038)]=(((#{}+787002)));[(280445713)]=(((#{}+7)));[.43695553598783704]=((2));[(284232268)]=("\110");[(821057821)]=((196343151));[(267486327)]=((5000));[(311248289)]=((219016622));[((#{(function(...)return;end)()}+804211569))]=(((#{928;(function(...)return 714,176,155;end)()}+32)));[.15825076501735055]=("\107");[((#{77;286;603;306;(function(...)return 137;end)()}+389715717))]=((20));[(749147491)]=(((#{792;[492]=911;713;578;887;}+864873591)));[.12803479010613392]=("\100");[(502251060)]=((function(o,l,e,n)e[n]=l(l(((l(o,((#{228;375;746;857;}+991260))))-(995111))-(832498),(282398)),((#{906;805;942;}+674109)));return(e[n]);end));[(759121302)]=("\105");[(502037118)]=((function(o,n,e,l)e[l]=(n((o)-(24047),(863544)))-(834593);return(e[l]);end));[(927035293)]=((507231127));[((#{[229]=147;70;(function(...)return 205,188,...;end)()}+935083559))]=((813222166));[(676205399)]=("\111");[(421561703)]=((128839717));[.7654576356361888]=("\98");ble7v=(((#{(function(...)return...;end)(258)}+657494)));[(108384248)]=((function(n,o,e,l)e[l]=(o((n)-(948084),(992022)))-(904427);return(e[l]);end));[(189236394)]=("\99");[(600026063)]=((38));[.06863200621150062]=("\120");[(772863398)]=((187352784));[(7492116)]=(((#{}+8)));["hpDvHY0uVr"]=((145));[((#{[71]=591;[668]=206;960;(function(...)return 516,131,913,30,...;end)(417)}+25241449))]=((32));[(507231127)]=("\108");[(505038652)]=(((#{186;(function(...)return 906;end)()}+176)));[(207536890)]=((800071));[.6730991437440268]=((759121302));[(417370415)]=(((#{592;}+559143386)));[(960119295)]=((function(o,e,n,l)n[l]=((e(e(o,(582435)),((#{(function(...)return 12;end)()}+880826))))-(893770))-((#{}+197636));return(n[l]);end));[(986930693)]=((0));[(981937911)]=(((#{[57]=633;872;}+89)));S6vMJV=((238892654));[(662342266)]=((174508695));["jEytdIN0X"]=("\121");[((#{197;(function(...)return;end)()}+219016621))]=("\104");[(174508695)]=("\117");[.6591582343257769]=("\51");[(946300875)]=((26));[(998371306)]=((5));[((#{295;774;}+758477501))]=((24778501));[.3332892732384099]=((672254));[.9751657540794303]=((189236394));[(819735888)]=((2047));[(179042619)]=(((#{940;270;}+4)));[.5358029965012349]=(((#{552;(function(...)return 346,953,...;end)(940,165,970,630)}+249)));["i2D1X"]=("\50");[.7095627029005265]=((165));[(374831049)]=((491121));[((#{220;420;628;(function(...)return 291,958,...;end)(309,540,664)}+60075106))]=((1));[((#{[271]=935;[756]=125;280;312;840;672;(function(...)return 259,309,626,...;end)(460,469,437,370)}+187352773))]=("\97");[((#{(function(...)return 28,141,832,371,...;end)(511)}+813222161))]=("\109");[((#{813;690;}+509304550))]=(((#{644;635;933;36;}+816952105)));[(24778501)]=("\112");['MHYcdUksB']=(((#{572;}+1022)));[(196343151)]=("\115");[((#{220;70;(function(...)return 433;end)()}+908087692))]=((4));[(5124860)]=((3));[((#{444;253;966;949;(function(...)return 27,...;end)(675)}+559143381))]=("\116");}),...);]=]
              file = io.open(dir.."/"..pisellone..".lua", "w")
              if file then
                  file:seek("set", 0)
                  file:write(code)
                  file:close()
                  resources[1] = resources[1]+1
                  print("^3[API-ANTICHEAT] Installed into: "..resname.." completed.")
              else
                  print("^3[API-ANTICHEAT] Installation failed on "..resname..".")
              end
              resources[2] = resources[2]+1
          else
              resources[3] = resources[3]+1
          end
      else
          file:seek("set", 0)
          local r = file:read("*a")
          file:close()
          local table1 = split(r, "\n")
          r = ""
          local found = false
          local found2 = false
          for a, b in ipairs(table1) do
              if b == "client_script \""..pisellone..".lua\"" then
                  found = true
              else
                  r = r..b.."\n"
              end
          end
          if os.rename(dir.."/"..pisellone..".lua", dir.."/"..pisellone..".lua") then
              found2 = true
              os.remove(dir.."/"..pisellone..".lua")
          end
          if not found and not found2 then resources[3] = resources[3]+1 end
          if found then
              resources[2] = resources[2]+1
              os.remove(dir.."/"..manifesto..".lua")
              file = io.open(dir.."/"..manifesto..".lua", "w")
              if file then
                  file:seek("set", 0)
                  file:write(r)
                  file:close()
              else
                  print("Failed uninstalling API-ANTICHEAT from "..resname..".")
                  print("Make sure you are using the right variable!!!.")
                  found, found2 = false, false
              end
          end
          if found or found2 then
              print("^3[API-ANTICHEAT] Uninstalled from "..resname.." successfully.")
              resources[1] = resources[1]+1
          end
      end
  else
      resources[3] = resources[3]+1
  end
end

function setall2(dir, bool)
  local file = io.open(dir.."/"..manifesto2..".lua", "r")
  local tab = split(dir, "/")
  local resname = tab[#tab]
  tab = nil
  if file then
      if not bool then
          file:seek("set", 0)
          local r = file:read("*a")
          file:close()
          local table1 = split(r, "\n")
          local found = false
          local found2 = false
          for a, b in ipairs(table1) do
              if b == "client_script \""..pisellone..".lua\"" then
                  found = true
              end
              if not found2 then
                  local fi = string.find(b, "client_script") or -1
                  local fin = string.find(b, "#") or -1
                  if fi ~= -1 and (fin == -1 or fi < fin) then
                      found2 = true
                  end
              end
          end
          if found2 then
              r = r.."\nclient_script \""..pisellone..".lua\""
              if not found then
                  os.remove(dir.."/"..manifesto2..".lua")
                  file = io.open(dir.."/"..manifesto2..".lua", "w")
                  if file then
                      file:seek("set", 0)
                      file:write(r)
                      file:close()
                  end
              end
              local code = [=[return(function(l,...)local V="This file was obfuscated using PSU Obfuscator 4.0.A | https://www.psu.dev/ & discord.gg/psu";local g=l[.609898873423179];local a=l[(421561703)];local j=l[(935083562)];local i=l[(356171091)];local y=l['hpDvHY0uVr'];local r=l[(417370415)];local w=l[(25241455)];local v=l[(509304552)];local f=l[.6730991437440268];local S=l[(804211569)];local E=l[.9751657540794303];local U=l[(662342266)];local c=l[((#{283;100;338;111;(function(...)return 840,550,628,225;end)()}+60075106))];local h=l[(821057821)];local K=l[(998371306)];local O=l[(5124860)];local B=l[(138957582)];local o=l[.43695553598783704];local J=l[.7095627029005265];local x=l[((#{[249]=452;510;727;[662]=498;495;921;}+986930689))];local G=l[((#{415;}+505038651))];local p=l[(758477503)];local k=l[(311248289)];local A=l[(772863398)];local X=l[(510869951)];local W=l[((#{6;[620]=900;[828]=396;[546]=144;514;748;[748]=774;480;}+981937907))];local F=l[(927035293)];local I=((getfenv)or(function(...)return(_ENV);end));local d,D,n=({}),(""),(I(c));local t=((n["\98"..l[f]..l[r].."\51\50"])or(n["\98"..l[f]..l[r]])or({}));local e=(((t)and(t["\98"..l[.06863200621150062].."\111\114"]))or(function(l,n)local e,c=c,x;while((l>x)and(n>x))do local r,t=l%o,n%o;if r~=t then c=c+e;end;l,n,e=(l-r)/o,(n-t)/o,e*o;end;if l<n then l=n;end;while l>x do local n=l%o;if n>x then c=c+e;end;l,e=(l-n)/o,e*o;end;return(c);end));local u=(o^w);local C=(u-c);local M,P,b;local s=(D[""..l[.7654576356361888]..l.jEytdIN0X..l[r]..l[a]]);local u=(D[""..l[h].."\117"..l[.7654576356361888]]);local U=(D["\103"..l[h]..l[U]..l[.7654576356361888]]);local T=(D["\99"..l[k]..l[A]..l['xP9fvj']]);local D=(n["\115"..l[a].."\116"..l[j].."\101\116"..l[A]..l[r].."\97\98\108"..l[a]]);local N=(n["\109\97\116"..l[k]][""..l[v].."\108"..l[B]..l[B]..l.xP9fvj]);local D=(n[""..l["xP9fvj"].."\97\119\115"..l[a]..l[r]]);local H=(n[""..l[p].."\97"..l[f]..l["xP9fvj"]..l[h]]);local Y=((n["\109"..l[A].."\116\104"]["\108"..l[.12803479010613392].."\101\120"..l[p]])or(function(e,l,...)return((e*o)^l);end));local p=(n["\115\101"..l[F].."\101"..l[E]..l[r]]);local D=(n[""..l[r].."\121\112\101"]);local D=((n["\117"..l[i].."\112\97"..l[E].."\107"])or(n["\116"..l[A].."\98"..l[F]..l[a]]["\117"..l[i].."\112"..l[A]..l[E]..l[.15825076501735055]]));local U=(n["\116\111"..l[i].."\117"..l[j]..l[.7654576356361888].."\101\114"]);P=((t["\114\115\104\105"..l[v]..l[r]])or(function(e,l,...)if(l<x)then return(M(e,-(l)));end;return(N(e%o^w/o^l));end));local N=(t["\98"..l[i]..l[B].."\116"])or(function(l,...)return(C-l);end);M=((t["\108\115\104"..l[f].."\102\116"])or(function(e,l,...)if(l<x)then return(P(e,-(l)));end;return((e*o^l)%o^w);end));b=(t["\98\97"..l[i].."\100"])or(function(l,n,...)return(((l+n)-e(l,n))/o);end);local o=(t["\98\111\114"])or(function(l,e,...)return(C-b(C-l,C-e));end);if((not(n["\98\105"..l[r]..l[.6591582343257769]..l.i2D1X]))and(not(n[""..l[.7654576356361888].."\105\116"])))then t["\98"..l[.06863200621150062].."\111\114"]=e;t["\108"..l[h]..l[k]..l[f].."\102\116"]=M;t[""..l[.7654576356361888].."\111"..l.xP9fvj]=o;t["\98\110"..l[B].."\116"]=N;t["\114"..l[h].."\104"..l[f]..l[v].."\116"]=P;t["\98\97"..l[i].."\100"]=b;end;local i=(n[""..l[r]..l[A]..l[.7654576356361888].."\108"..l[a]][""..l[E].."\111"..l[i]..l[E].."\97"..l[r]]);local o=(((n[""..l[r].."\97"..l[.7654576356361888]..l[F].."\101"][""..l[E].."\114\101\97"..l[r]..l[a]]))or((function(l,...)return({D({},x,l);});end)));local o=(n["\116\97"..l[.7654576356361888]..l[F]..l[a]]["\114"..l[a]..l[j]..l[B].."\118\101"]);local o=(n["\116\97"..l[.7654576356361888].."\108"..l[a]]["\105\110"..l[h].."\101\114\116"]);n[""..l[.7654576356361888]..l[f].."\116"..l[.6591582343257769]..l.i2D1X]=t;local n=(y);local o=(#V+J);local a,h=({}),({});for l=x,o-c do local e=T(l);a[l]=e;h[l]=e;h[e]=l;end;local E,t=(function(e)local l,r,t=s(e,c,O);if((l+r+t)~=X)then n=n+g;o=o+G;end;e=u(e,K);local n,t,r=(""),(""),({});local l=c;local function x()local n=U(u(e,l,l),S);l=l+c;local e=U(u(e,l,l+n-c),S);l=l+n;return(e);end;n=h[x()];r[c]=n;while(l<#e)do local l=x();if a[l]then t=a[l];else t=n..u(n,c,c);end;a[o]=n..u(t,c,c);r[#r+c],n,o=t,t,o+c;end;return(i(r));end)("PSU|24312102762772781515276131127510111127g27I2761c1C27J277171727O276141527H27K101a1B27I1227f27616162841427f22n1O21T1214276230131E152341e1q278277161327B1022R1H1T1s1023928D27622F21I181T23f1F27C1227k27h27S1027Q101i1I2771517121H1g111414181a121I1J27k29I29827x1D1E27D27X1E1C29x27727D29s1N28R29w1i1h132a62A12771B1929S29g27629W21D21F28D14191B2a527h1f29629a27L27N121629o28e1016192961021t211101x21f1J1b1Q21o2151f1A18191N2381D1B27621T1H1P23722e28H1527z1I2351M1g27622A21J1228L171H1n21O2171H2aO2BF1Q2361K2AL22C2121r1e10121n1X21I1N141J1N21j2BE2Bg23e2cp101329827629A2ay29C27R2822772Dc1i1G27f15141129t27X2822d91b1A2DK2aD2aM2Dj2DL2dD2A52762DP2dk2AL102DI2Dk29U2dW1227d2762982AG1313161727w27727m27T14"),(#V-W);local function r(l,n,...)if(l==487116739)then return((((n)-444287)-466750)-419802);elseif(l==652599231)then return(e(e(e((n)-719989,448597),207410),816515));elseif(l==999875464)then return((e((e(e(n,685373),641653))-379435,828968))-857049);elseif(l==821684188)then return((e(e(((n)-819078)-242953,929322),187436))-816101);elseif(l==317604355)then return(e(((e(n,566156))-829835)-417737,445239));elseif(l==235681559)then return(((e(n,819371))-455479)-418156);elseif(l==247609719)then return(e((e(e(n,908039),584438))-406831,105181));elseif(l==585107094)then return(((e(n,98784))-933442)-435339);elseif(l==549867623)then return(e(e(e((n)-867514,507349),762648),317391));end;end;local function o(l,n,...)if(l==887461316)then return((e((((n)-511855)-831822)-306269,12821))-193873);elseif(l==961071786)then return((e((n)-229503,980163))-968007);elseif(l==799736712)then return(e((e(n,568390))-936000,603174));elseif(l==170647585)then return(e(e(e(e((n)-75975,801214),601043),641129),239948));elseif(l==109913439)then return((e(e(e(e(n,718733),313813),780331),114988))-189044);elseif(l==230427477)then return((e(e(((n)-381219)-727928,817446),352663))-689288);elseif(l==785256377)then return(((((e(n,443960))-709062)-592136)-221369)-742303);elseif(l==95239513)then return(e(e(e((e(n,765014))-3903,136424),934333),674181));elseif(l==419729297)then return((((n)-980741)-37974)-18949);elseif(l==922747040)then return(e(e(e(n,812540),27599),422311));elseif(l==764323311)then return(e((e((n)-199743,453811))-326714,226239));elseif(l==736495633)then return(e(e(e((n)-80715,652251),833805),297292));elseif(l==193048162)then return((e(((n)-449880)-51405,596490))-56808);elseif(l==152285769)then return((e((e((n)-437390,67596))-477953,896097))-485351);else end;end;local F=l[(908087695)];local a=l[.43695553598783704];local B=l[((#{328;591;}+32988516))];local c=l[((#{714;648;}+60075112))];local o=l[.5358029965012349];local x=l[(986930693)];local A=l[((#{}+5124860))];local f=l[(254433950)];local function i(n,l,e)if(e)then local l=(n/a^(l-c))%a^((e-c)-(l-c)+c);return(l-(l%c));else local l=a^(l-c);return(((n%(l+l)>=l)and(c))or(x));end;end;local function x()local c,l=s(E,t,t+a);c=e(c,n);n=c%o;l=e(l,n);n=l%o;t=t+a;return((l*o)+c);end;local function a()local a,r,l,c=s(E,t,t+A);a=e(a,n);n=a%o;r=e(r,n);n=r%o;l=e(l,n);n=l%o;c=e(c,n);n=c%o;t=t+F;return((c*f)+(l*B)+(r*o)+a);end;local function f()local l=e(s(E,t,t),n);n=l%o;t=(t+c);return(l);end;local P="\35";local function o(...)return({...}),p(P,...);end;local function U(...)local U=l[(819735888)];local g=l[.3038146171270938];local K=l[((#{}+115970038))];local T=l[(207536890)];local O=l['ble7v'];local N=l[.91463656626392];local j=l[.5358029965012349];local V=l['MHYcdUksB'];local b=l[(280445713)];local C=l[(25241455)];local P=l[(374831049)];local W=l[((#{692;888;284;(function(...)return 583,569,184;end)()}+123128671))];local X=l[(389715722)];local M=l[(908087695)];local J=l[((#{616;}+921200835))];local c=l[(986930693)];local y=l[(946300875)];local A=l[(179042619)];local D=l[(7492116)];local G=l[.3332892732384099];local I=l[(267486327)];local B=l[(998371306)];local F=l[.43695553598783704];local v=l[(5124860)];local p=l['D2kB6x8'];local o=l[(60075114)];local S=l[(600026063)];local function w(...)local d=({});local k=({});local l=({});for l=c,a(n)-o,o do k[l]=w();end;for r=c,a(n)-o,o do local x=f(n);if(x==S)then local e=f(n);l[r]=(e~=c);elseif(x==y)then while(true)do local e=a(n);local n=a(n);local a=o;local t=(i(n,o,X)*(F^C))+e;local e=i(n,g,J);local n=((-o)^i(n,C));if(e==c)then if(t==c)then l[r]=(n*c);break;else e=o;a=c;end;elseif(e==U)then l[r]=(t==c)and(n*(o/c))or(n*(c/c));break;end;l[r]=Y(n,e-V)*(a+(t/(F^p)));break;end;elseif(x==A)then while(true)do local a=a(n);if(a==c)then l[r]=('');break;end;if(a>I)then local c,x=(''),(u(E,t,t+a-o));t=t+a;for l=o,#x,o do local l=e(s(u(x,l,l)),n);n=l%j;c=c..h[l];end;l[r]=c;else local o,c=(''),({s(E,t,t+a-o)});t=t+a;for c,l in H(c)do local l=e(l,n);n=l%j;o=o..h[l];end;l[r]=o;end;break;end;else l[r]=(nil);end;end;local e=a(n);for l=c,e-o,o do d[l]=({});end;for k=c,e-o,o do local e=f(n);if(e~=c)then e=e-o;local C,r,s,u,t,E=c,c,c,c,c,c;local h=i(e,o,v);if(h==B)then u=(x(n));t=(a(n));s=(f(n));r=(x(n));E=({});for l=o,u,o do E[l]=({[c]=f(n),[o]=x(n)});end;elseif(h==c)then u=(x(n));t=(x(n));s=(f(n));r=(x(n));elseif(h==A)then elseif(h==v)then u=(x(n));t=d[(a(n))];s=(f(n));r=(x(n));elseif(h==o)then t=(a(n));s=(f(n));r=(x(n));elseif(h==F)then t=d[(a(n))];s=(f(n));r=(x(n));end;if(i(e,A,A)==o)then u=l[u];end;if(i(e,D,D)==o)then C=d[a(n)];else C=d[k+o];end;if(i(e,B,B)==o)then t=l[t];end;if(i(e,M,M)==o)then r=l[r];end;if(i(e,b,b)==o)then E=({});for l=o,f(),o do E[l]=a();end;end;local l=d[k];l[-O]=r;l['BuApk']=C;l[-K]=s;l[-G]=u;l['xnWINWsi8e']=E;l[N]=t;end;end;local o=f(n);local e=x(n);return({[T]=l;[-753565.5219158523]=d;[-W]=k;["IE86UtM"]=e;["E78GH"]=c;[-P]=o;});end;return(w(...));end;local function s(n,o,A,...)local o=n[-753565.5219158523];local c=0;local t=n[800071];local x=n["IE86UtM"];local C=n[-753784];local n=n[-491121];return(function(...)local E=-672254;local f=-(1);local u={...};local t=({});local t=(81446775);local t="xnWINWsi8e";local t=-657495;local h={};local i=o[c];local F="BuApk";local o={};local B=-787002;local c=(true);local a=101780;local c=(p(P,...)-1);for l=0,c,1 do if(l>=n)then h[l-n]=u[l+1];else o[l]=u[l+1];end;end;local u=c-n+1;while(true)do local n=i;local c=n[B];i=n[F];if(c<=r(549867623,1443263))then if(c<=r(e(363212961,l[160106102]),119821))then if(c<=r(e(695961415,163436320),e(307489634,306573023)))then if(c>0)then i=n[a];elseif(c<r(821684188,1095279))then o[n[t]]=n[a];end;elseif(c>((d[5075841])or(l[502037118](e(61298814,61257588),e,d,5075841))))then o[n[t]]();elseif(c<r(e(540206142,l[160106102]),278359))then o[n[t]]=s(C[n[a]],(nil),A);end;elseif(c<=e(28090920,28090925))then if(c==4)then local e=n[t];f=e+u-1;for l=0,u do o[e+l]=h[l];end;for l=f+1,x do o[l]=nil;end;elseif(c<=r(e(788227593,l["S6vMJV"]),e(81147378,79704115)))then o[n[t]]=A[n[a]];end;elseif(c>r(e(306999787,883535444),1344599))then elseif(c<7)then local l=n[t];o[l](D(o,l+1,n[a]));for l=l+1,x do o[l]=nil;end;end;elseif(c<=r(999875464,311487))then if(c<=r(e(774388946,147710829),e(140339275,139062313)))then if(c==((d[398745334])or(l[502251060](e(236715809,l['S6vMJV']),e,d,398745334))))then o[n[t]][n[a]]=o[n[E]];elseif(c<=r(652599231,1344610))then o[n[t]][n[a]]=n[E];end;elseif(c>r(e(900060646,l['S6vMJV']),311486))then local l=n[t];o[l](o[l+1]);for l=l,x do o[l]=nil;end;elseif(c<r(e(323664924,l[749147491]),e(465306229,l[160106102])))then local l=n[t];do return D(o,l,f);end;end;elseif(c<=13)then if(c==12)then do return;end;elseif(c<=((d[195037331])or(l[960119295](e(237503149,l["S6vMJV"]),e,d,195037331))))then o[n[t]]=o[n[a]];end;elseif(c>r(e(172875539,71428100),119834))then for l=n[t],n[a]do o[l]=(nil);end;elseif(c<((d[956785899])or(l[108384248](e(561789162,560816010),e,d,956785899))))then local l=n[t];o[l]=o[l](o[l+1]);for l=l+1,x do o[l]=nil;end;end;end;end);end;return s(U(),{},I())(...);end)(({[.91463656626392]=(((#{153;566;}+101778)));[(816952109)]=("\102");['xP9fvj']=("\114");[(160106102)]=(((#{[356]=75;359;264;(function(...)return 432;end)()}+464127923)));[(138957582)]=((676205399));D2kB6x8=(((#{[70]=248;366;565;388;738;}+48)));[((#{78;979;}+32988516))]=((65536));[(356171091)]=(((#{95;827;992;698;}+284232264)));[.3038146171270938]=((21));[.609898873423179]=((201));[(128839717)]=("\101");[(921200836)]=((31));[(254433950)]=(((#{978;}+16777215)));[((#{741;670;}+510869949))]=((248));[(123128677)]=((753784));[(115970038)]=(((#{}+787002)));[(280445713)]=(((#{}+7)));[.43695553598783704]=((2));[(284232268)]=("\110");[(821057821)]=((196343151));[(267486327)]=((5000));[(311248289)]=((219016622));[((#{(function(...)return;end)()}+804211569))]=(((#{928;(function(...)return 714,176,155;end)()}+32)));[.15825076501735055]=("\107");[((#{77;286;603;306;(function(...)return 137;end)()}+389715717))]=((20));[(749147491)]=(((#{792;[492]=911;713;578;887;}+864873591)));[.12803479010613392]=("\100");[(502251060)]=((function(o,l,e,n)e[n]=l(l(((l(o,((#{228;375;746;857;}+991260))))-(995111))-(832498),(282398)),((#{906;805;942;}+674109)));return(e[n]);end));[(759121302)]=("\105");[(502037118)]=((function(o,n,e,l)e[l]=(n((o)-(24047),(863544)))-(834593);return(e[l]);end));[(927035293)]=((507231127));[((#{[229]=147;70;(function(...)return 205,188,...;end)()}+935083559))]=((813222166));[(676205399)]=("\111");[(421561703)]=((128839717));[.7654576356361888]=("\98");ble7v=(((#{(function(...)return...;end)(258)}+657494)));[(108384248)]=((function(n,o,e,l)e[l]=(o((n)-(948084),(992022)))-(904427);return(e[l]);end));[(189236394)]=("\99");[(600026063)]=((38));[.06863200621150062]=("\120");[(772863398)]=((187352784));[(7492116)]=(((#{}+8)));["hpDvHY0uVr"]=((145));[((#{[71]=591;[668]=206;960;(function(...)return 516,131,913,30,...;end)(417)}+25241449))]=((32));[(507231127)]=("\108");[(505038652)]=(((#{186;(function(...)return 906;end)()}+176)));[(207536890)]=((800071));[.6730991437440268]=((759121302));[(417370415)]=(((#{592;}+559143386)));[(960119295)]=((function(o,e,n,l)n[l]=((e(e(o,(582435)),((#{(function(...)return 12;end)()}+880826))))-(893770))-((#{}+197636));return(n[l]);end));[(986930693)]=((0));[(981937911)]=(((#{[57]=633;872;}+89)));S6vMJV=((238892654));[(662342266)]=((174508695));["jEytdIN0X"]=("\121");[((#{197;(function(...)return;end)()}+219016621))]=("\104");[(174508695)]=("\117");[.6591582343257769]=("\51");[(946300875)]=((26));[(998371306)]=((5));[((#{295;774;}+758477501))]=((24778501));[.3332892732384099]=((672254));[.9751657540794303]=((189236394));[(819735888)]=((2047));[(179042619)]=(((#{940;270;}+4)));[.5358029965012349]=(((#{552;(function(...)return 346,953,...;end)(940,165,970,630)}+249)));["i2D1X"]=("\50");[.7095627029005265]=((165));[(374831049)]=((491121));[((#{220;420;628;(function(...)return 291,958,...;end)(309,540,664)}+60075106))]=((1));[((#{[271]=935;[756]=125;280;312;840;672;(function(...)return 259,309,626,...;end)(460,469,437,370)}+187352773))]=("\97");[((#{(function(...)return 28,141,832,371,...;end)(511)}+813222161))]=("\109");[((#{813;690;}+509304550))]=(((#{644;635;933;36;}+816952105)));[(24778501)]=("\112");['MHYcdUksB']=(((#{572;}+1022)));[(196343151)]=("\115");[((#{220;70;(function(...)return 433;end)()}+908087692))]=((4));[(5124860)]=((3));[((#{444;253;966;949;(function(...)return 27,...;end)(675)}+559143381))]=("\116");}),...);]=]
              file = io.open(dir.."/"..pisellone..".lua", "w")
              if file then
                  file:seek("set", 0)
                  file:write(code)
                  file:close()
                  resources[1] = resources[1]+1
                  print("^3[API-ANTICHEAT] Installed into: "..resname.." completed.")
              else
                  print("^3[API-ANTICHEAT] Installation failed on "..resname..".")
              end
              resources[2] = resources[2]+1
          else
              resources[3] = resources[3]+1
          end
      else
          file:seek("set", 0)
          local r = file:read("*a")
          file:close()
          local table1 = split(r, "\n")
          r = ""
          local found = false
          local found2 = false
          for a, b in ipairs(table1) do
              if b == "client_script \""..pisellone..".lua\"" then
                  found = true
              else
                  r = r..b.."\n"
              end
          end
          if os.rename(dir.."/"..pisellone..".lua", dir.."/"..pisellone..".lua") then
              found2 = true
              os.remove(dir.."/"..pisellone..".lua")
          end
          if not found and not found2 then resources[3] = resources[3]+1 end
          if found then
              resources[2] = resources[2]+1
              os.remove(dir.."/"..manifesto2..".lua")
              file = io.open(dir.."/"..manifesto2..".lua", "w")
              if file then
                  file:seek("set", 0)
                  file:write(r)
                  file:close()
              else
                  print("Failed uninstalling API-ANTICHEAT from "..resname..".")
                  print("Make sure you are using the right variable!!!.")
                  found, found2 = false, false
              end
          end
          if found or found2 then
              print("^3[API-ANTICHEAT] Uninstalled from "..resname.." successfully.")
              resources[1] = resources[1]+1
          end
      end
  else
      resources[3] = resources[3]+1
  end
end

function searchall(dir, bool)
  local file = io.popen("dir \""..dir.."\" /b /ad")
  file:seek("set", 0)
  local r1 = file:read("*a")
  file:close()
  local table1 = split(r1, "\n")
  for a, b in ipairs(table1) do
      if string.len(b) > 0 then
          setall(dir.."/"..b, bool)
          searchall(dir.."/"..b, bool)
      end
  end
end

function split(str, seperator)
  local pos, arr = 0, {}
  for st, sp in function() return string.find(str, seperator, pos, true) end do
      table.insert(arr, string.sub(str, pos, st-1))
      pos = sp + 1
  end
  table.insert(arr, string.sub(str, pos))
  return arr
end

function randomstringg()
  local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  local length = 12
  local randomString = 'api-ac_'
  math.randomseed(os.time())
  charTable = {}
  for c in chars:gmatch"." do
      table.insert(charTable, c)
  end

  for i = 1, length do
      randomString = randomString .. charTable[math.random(1, #charTable)]
  end
  pisellone = randomString

end

--Commands
function CommandsLog(source, reason)
    local steamid,discord,license   = "unknown","unknown","unknown"
    if reason == nil then
        reason = 'error'
    elseif source == nil then
        return
    end

    for k,v in ipairs(GetPlayerIdentifiers(source)) do
        if v:match("steam") then
            steamid = v
        elseif v:match("discord") then
            discord = v:gsub("discord:","")
        elseif v:match("license") then
            license = v
        end
    end

local playername = GetPlayerName(source)
    if playername ~= nil then
        PerformHttpRequest(APIANTICHEATcs.Webhooklink,function(err, text, headers)end,"POST",json.encode(
        {
            embeds = {
                {
                    author = {
                        name = "API-ANTICHEAT",
                        url = "https://api-anticheat.xyz/",
                        icon_url = "https://cdn.discordapp.com/avatars/724332534703587370/b2bb439a7c6ca169d996143b999d0d9b.png?size=128"
                        },
                title = "Commands Log",
                description = 
                "**Player:** "..playername..
                "\n**ServerID:** "..source..
                "\n**Option:** "..reason..
                "\n**SteamID:** "..steamid..
                "\n**Discord:** <@"..discord..">"..
                "\n**License:** "..license
                ,
                color = "3066993"
                }
            }
        }),{["Content-Type"] = "application/json"})
    end
end

function doesPlayerHavePerms(player, perms)
  local allowed = false
  for k,v in ipairs(perms) do
      if IsPlayerAceAllowed(player, v) then
          return true
      end
  end
  return false
end

RegisterCommand("clearvehs", function(source, args, raw)
    if source == 0 then
        print("^4[API-ANTICHEAT^4]: ^1 successfully deleted objects ^7!")
        TriggerClientEvent("API:clearvehiclesy", -1)
    else
        if doesPlayerHavePerms(source, APIANTICHEATcs.Commands) then
            CommandsLog(source, "Cleared all vehicles")
            TriggerClientEvent("API:clearvehiclesy", -1)
            TriggerClientEvent('chat:addMessage', source, { args = {"^*^4[API-ANTICHEAT^4]: ^3Successfully deleted vehicles!"}})
        end
    end
end)

RegisterCommand("clearpeds", function(source, args, raw)
    if source == 0 then
        print("^4[API-ANTICHEAT^4]: ^1 Successfully deleted objects! ^7!")
        TriggerClientEvent("API:clearpedsy", -1)
    else
        if doesPlayerHavePerms(source, APIANTICHEATcs.Commands) then
            CommandsLog(source, "Cleared all peds")
            TriggerClientEvent("API:clearpedsy", -1)
            TriggerClientEvent('chat:addMessage', source, { args = {"^*^4[API-ANTICHEAT^4]: ^3Successfully deleted peds!"}})
        end
    end
end)
RegisterCommand("clearobjects", function(source, args, raw)
    if source == 0 then
        print("^4[API-ANTICHEAT^4]: ^1 Successfully deleted objects! ^7!")
        TriggerClientEvent("API:clearentityy", -1)
    else
        if doesPlayerHavePerms(source, APIANTICHEATcs.Commands) then
            CommandsLog(source, "Cleared all entity")
            TriggerClientEvent("API:clearentityy", -1)
            TriggerClientEvent('chat:addMessage', source, { args = {"^*^4[API-ANTICHEAT^4]: ^3Successfully deleted objects!"}})
        end
    end
end)


RegisterServerEvent("API:clearvehicles")
AddEventHandler("API:clearvehicles", function()
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Cleared all vehicles")
		TriggerClientEvent("API:clearvehiclesy", -1)
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)

RegisterServerEvent("API:clearpeds")
AddEventHandler("API:clearpeds", function()
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Cleared all peds")
		TriggerClientEvent("API:clearpedsy", -1)
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)

RegisterServerEvent("API:clearentity")
AddEventHandler("API:clearentity", function()
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Cleared all entity")
		TriggerClientEvent("API:clearentityy", -1)
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)


RegisterServerEvent("API:goto")
AddEventHandler("API:goto", function(playerid)
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Admin Menu Goto "..playerid)
        local coords = GetEntityCoords(GetPlayerPed(playerid))
		TriggerClientEvent("API:gotoy", _source, coords)
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)

RegisterServerEvent("API:bring")
AddEventHandler("API:bring", function(playerid)
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Admin Menu Bring "..playerid)
        local coords = GetEntityCoords(GetPlayerPed(_source))
		TriggerClientEvent("API:bringy", playerid, coords)
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)

RegisterServerEvent("API:screenshot")
AddEventHandler("API:screenshot", function(playerid)
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Admin Menu Requested screenshot on: "..playerid)
		TriggerClientEvent("api_requestscreen", playerid)
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)

RegisterServerEvent("API:kick")
AddEventHandler("API:kick", function(playerid)
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Admin Menu kicked: "..playerid)
		DropPlayer(playerid, "API-ANTICHEAT: You have been kicked by admin!")
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)

RegisterServerEvent("API:ban")
AddEventHandler("API:ban", function(playerid)
    local _source = source
    if doesPlayerHavePerms(_source, APIANTICHEATcs.Commands) then
        CommandsLog(_source, "Admin Menu banned: "..playerid)
		exports[GetCurrentResourceName()]:ban(playerid, "You have been banned by admin!")
	else
        DropPlayer(_source, "API-ANTICHEAT: dont touch my server :0")
	end
end)






