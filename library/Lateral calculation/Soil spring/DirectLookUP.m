function [kstop,ksbot]=DirectLookUP(x_ave,ytop,ybot,PLAXIS)
                                
                                    
[minValue,closestIndex] = min(abs(x_ave-PLAXIS.depth'));
                                                                       
 X_curve=PLAXIS.X_curve;
 Y_curve=PLAXIS.Y_curve;
 
 %obserX=unique(X_curve(closestIndex,:),'stable');
 %obserY=unique(Y_curve(closestIndex,:),'stable');

 obserX=X_curve(closestIndex,:);
 obserY=Y_curve(closestIndex,:);
                                    
  
 % get the P corresponding to the Y value 
 
 P_top=interp1(ytop,obserX,obserY);
 P_bot=interp1(ybot,obserX,obserY);
 
 K_ini=obserY(1,2)/obserX(1,2);
 
 if ytop == 0
    kstop = K_ini; 
elseif xtop == 0
    kstop = 0;
else
	kstop = P_top./ytop;
 end
 
if ybot == 0
    ksbot = K_ini;
else
	ksbot = P_bot./ybot;

end 
end 
