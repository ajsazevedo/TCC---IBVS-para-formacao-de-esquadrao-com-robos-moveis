function visualize(image,pose)
[n,m,l]=size(image);
next=0;
nextarrow=0;
nextp1=0;
nextp2=0;
nextp3=0;
nextp4=0;
wl=0;
wr=0;
figure(1);
clf;
xsn1=[-1 -1 -0.5 -0.5 -1];
ysn1=[-1 1 1 -1 -1];
xsn2=[1 1 0.5 0.5 1];
ysn2=[-1 1 1 -1 -1];
% patch(xsn2,ysn2,'g-','FaceAlpha',0,'LineWidth',5,'EdgeColor',[0 1 1],'LineStyle','--');
   
figure(2);
clf;
%rectangle('Position',[-0.25 -1 0.5 0.5],'Curvature',[1 1],'LineWidth',5,'EdgeColor',[0 0 0]);
patch([-0.35 0.35 0.35 -0.35],[-1-0.45 -1-0.45 -1+0.45 -1+0.45],'g');
 axis([-6 6 -11 1]);
    line([-6 6],[0 0],'Color','r','Linewidth',5);
    line([-1 -0.5],[0 0],'Color','g','Linewidth',5);
    line([0.5 1],[0 0],'Color','g','Linewidth',5);
    
for k=1:l
    x=[image(1,:,k) image(1,1,k)];
    y=[image(2,:,k) image(2,1,k)]; 
    p1x=[image(1,1,k) 0.75*image(1,1,k)+0.25*image(1,2,k) 0.75*image(1,4,k)+0.25*image(1,3,k) image(1,4,k)];
    p1y=[image(2,1,k) 0.75*image(2,1,k)+0.25*image(2,2,k) 0.75*image(2,4,k)+0.25*image(2,3,k) image(2,4,k)];
    p2x=[image(1,2,k) 0.25*image(1,1,k)+0.75*image(1,2,k) 0.25*image(1,4,k)+0.75*image(1,3,k) image(1,3,k)];
    p2y=[image(2,2,k) 0.25*image(2,1,k)+0.75*image(2,2,k) 0.25*image(2,4,k)+0.75*image(2,3,k) image(2,3,k)];
    ppx=[image(1,1,k) image(1,2,k)];
    ppy=[-2.0*image(2,1,k)+image(2,4,k) -2.0*image(2,2,k)+image(2,3,k)];
    pfx=[-1.4 1.4 1.4 -1.4];
    pfy=[ppy(1)+(-1.4-ppx(1))/(ppx(2)-ppx(1))*(ppy(2)-ppy(1)) ppy(1)+(1.4-ppx(1))/(ppx(2)-ppx(1))*(ppy(2)-ppy(1)) -1.4 -1.4];
    pfy2=[pfy(1) pfy(2) 1.4 1.4];
    xs=[-1 -1 1 1 -1];
    ys=[-1 1 1 -1 -1];
    
    figure(1);
    %plot(xsn1,ysn1,'b-',xsn2,ysn2,'b-','LineWidth',3);
  
    lastp3=nextp3;
    nextp3=patch(pfx,pfy,'b');
    lastp4=nextp4;
    nextp4=patch(pfx,pfy2,'r');
    % patch(xsn1,ysn1,'g-');
    
    lastp1=nextp1;
    nextp1=patch(p1x,p1y,'g');
    lastp2=nextp2;
    nextp2=patch(p2x,p2y,'g');
   
    rectangle('Position',[-1.05 0.95 0.1 0.1],'FaceColor','y','Curvature',[1 1]);
    rectangle('Position',[-1.05 -1.05 0.1 0.1],'FaceColor','y','Curvature',[1 1]);
    rectangle('Position',[0.95 -1.05 0.1 0.1],'FaceColor','y','Curvature',[1 1]);
    rectangle('Position',[0.95 0.95 0.1 0.1],'FaceColor','y','Curvature',[1 1]);
    rectangle('Position',[x(1)-0.05 y(1)-0.05 0.1 0.1],'FaceColor','b','Curvature',[1 1]);
    rectangle('Position',[x(2)-0.05 y(2)-0.05 0.1 0.1],'FaceColor','b','Curvature',[1 1]);
    rectangle('Position',[x(3)-0.05 y(3)-0.05 0.1 0.1],'FaceColor','b','Curvature',[1 1]);
    rectangle('Position',[x(4)-0.05 y(4)-0.05 0.1 0.1],'FaceColor','b','Curvature',[1 1]);
    
  
    if(k>1)
        delete(lastp1); 
        delete(lastp2);
        delete(lastp3);
        delete(lastp4);
    end
    % plot(x,y,'r-',xs,ys,'b-','LineWidth',5);
    axis([-1.4 1.4 -1.4 1.4]);
    axis manual;
    %axis equal;
    figure(2);
    %clf;
    
    
    axis equal;
    last=next;
    lastwl=wl;
    lastwr=wr;
    lastarrow=nextarrow;
    %next=rectangle('Position',[-pose(k,1)-0.25 -pose(k,2)-0.25 0.5 0.5],'Curvature',[0 0],'LineWidth',5,'EdgeColor',[1 0 0]);
    next=patch([-pose(k,1)-0.35 -pose(k,1)+0.35 -pose(k,1)+0.35 -pose(k,1)-0.35],[-pose(k,2)-0.45 -pose(k,2)-0.45 -pose(k,2)+0.45 -pose(k,2)+0.45],'r');
    wl=patch([-pose(k,1)-0.35 -pose(k,1)-0.5 -pose(k,1)-0.5 -pose(k,1)-0.35],[-pose(k,2)-0.25 -pose(k,2)-0.25 -pose(k,2)+0.25 -pose(k,2)+0.25],'k');
    wr=patch([-pose(k,1)+0.35 -pose(k,1)+0.5 -pose(k,1)+0.5 -pose(k,1)+0.35],[-pose(k,2)-0.25 -pose(k,2)-0.25 -pose(k,2)+0.25 -pose(k,2)+0.25],'k');
    rotate(next,[0 0 1],180*pose(k,3)/pi,[-pose(k,1)-0.25 -pose(k,2)-0.25 0]);
    rotate(wl,[0 0 1],180*pose(k,3)/pi,[-pose(k,1)-0.25 -pose(k,2)-0.25 0]);
    rotate(wr,[0 0 1],180*pose(k,3)/pi,[-pose(k,1)-0.25 -pose(k,2)-0.25 0]);
   %nextarrow=line([-pose(k,1) -pose(k,1)-0.5*sin(pose(k,3))],[-pose(k,2) -pose(k,2)+0.5*cos(pose(k,3))],'LineWidth',5,'Color',[0 0 1]);
    if (k>1) & (mod(k,10)~=0)
        delete(last);
        delete(lastwl);
        delete(lastwr);
        % rectangle('Position',[-pose(k-1,1) -pose(k-1,2) 0.5 0.5],'Curvature',[1 1],'LineWidth',5,'EdgeColor',[0 0 0]);
    end
    %if (mod(k,10)==0)
    %    rectangle('Position',[-pose(k,1)-0.25 -pose(k,2) 0.5 0.5],'Curvature',[1 1],'LineWidth',2,'EdgeColor',[1 0 0]);
    %    line([-pose(k,1)+0.25 -pose(k,1)+0.25-0.5*sin(pose(k,3))],[-pose(k,2)+0.25 -pose(k,2)+0.25+0.5*cos(pose(k,3))],'LineWidth',2,'Color',[0 1 0]);
    %
    %end
    drawnow;
    pause(0.05);
end