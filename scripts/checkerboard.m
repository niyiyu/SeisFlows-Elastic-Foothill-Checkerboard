NPROC = 1;
mkdir('./model_homo')
mkdir('./model_checkerboard')
rx = 2000;
ry = [500, 1000, 2000];
amp = 0.08;
coefx = 4;
coefy = 4;
vshomo = 3000;
vphomo = 5000;
for PROC = 1:NPROC
%     homo = load(['./proc',num2str(PROC-1,'%06d'),'_rho_vp_vs.dat']);
    grad = load(['./model_initial/proc',num2str(PROC-1,'%06d'),'_rho_vp_vs.dat']);
    
    homo = grad;
    homo(:,4) = vphomo;
    homo(:,5) = vshomo;
    save(['./model_homo/proc',num2str(PROC-1,'%06d'),'_rho_vp_vs.dat'],'homo','-ascii')
    
    for i=1:length(homo)
        if 4000 < homo(i,2) && homo(i,2) <= 6000
            %disp("Case 1");
            sig = floor(homo(i,1)/rx) + floor((homo(i,2)-4000)/ry(1));
            homo(i,5) = grad(i,5)+(-1)^sig*amp.*vshomo.*exp(-((mod(homo(i,1),rx)-rx/2)/(rx/coefx)).^2-((mod(homo(i,2)-4000,ry(1))-ry(1)/2)/(ry(1)/coefy)).^2); 
            homo(i,4) = grad(i,4)+(-1)^sig*amp.*vphomo.*exp(-((mod(homo(i,1),rx)-rx/2)/(rx/coefx)).^2-((mod(homo(i,2)-4000,ry(1))-ry(1)/2)/(ry(1)/coefy)).^2); 
        elseif 2000 < homo(i,2) && homo(i,2) <= 4000
            %disp("Case 2");
            sig = floor(homo(i,1)/rx) + floor((homo(i,2)-2000)/ry(2));
            homo(i,5) = grad(i,5) + (-1)^sig*amp.*vshomo.*exp(-((mod(homo(i,1),rx)-rx/2)/(rx/coefx)).^2-((mod(homo(i,2)-2000,ry(2))-ry(2)/2)/(ry(2)/coefy)).^2); 
            homo(i,4) = grad(i,4) + (-1)^sig*amp.*vphomo.*exp(-((mod(homo(i,1),rx)-rx/2)/(rx/coefx)).^2-((mod(homo(i,2)-2000,ry(2))-ry(2)/2)/(ry(2)/coefy)).^2); 
        else
            %disp("Case 5");
            sig = floor(homo(i,1)/rx) + floor(homo(i,2)/ry(3))+1;
            homo(i,5) = grad(i,5) + (-1)^sig*amp.*vshomo.*exp(-((mod(homo(i,1),rx)-rx/2)/(rx/coefx)).^2-((mod(homo(i,2)-0,ry(3))-ry(3)/2)/(ry(3)/coefy)).^2); 
            homo(i,4) = grad(i,4) + (-1)^sig*amp.*vphomo.*exp(-((mod(homo(i,1),rx)-rx/2)/(rx/coefx)).^2-((mod(homo(i,2)-0,ry(3))-ry(3)/2)/(ry(3)/coefy)).^2); 
        end
        
    end    

    save(['./model_checkerboard/proc',num2str(PROC-1,'%06d'),'_rho_vp_vs.dat'],'homo','-ascii')

end
