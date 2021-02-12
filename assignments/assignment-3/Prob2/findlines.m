function [ lines ] = findlines( imge,map,theta,rho,minLen,maxLineNum,maxPeakNum,maxGap )
[pri,  pti] = findpeaks(map, minLen, maxPeakNum);
PP = [pri; pti]';

%[pri,  pti];
peakNum = length(pri);
prho = rho(pri); % peak points
pthe = theta(pti) * pi / 180;
rhoThres = abs(rho(2)-rho(1))/2;

fitPts = cell(1,peakNum);
fitPtsNum = zeros(1,peakNum);
for p = 1:peakNum
	 % store points which are on the lines
	fitPts{p} = zeros(2,ceil(map(pri(p),pti(p))*1.2));
end
[Y, X] = find(imge);
X = X-1; % The origin is the bottom-left corner.
M = size(imge,1);
Y = M-Y;

% find the points that's on the selected lines
for p = 1:length(X)
	rho1 = X(p)*sin(pthe)+Y(p)*cos(pthe);
	isOnPeak = find(abs(rho1-prho) <= rhoThres);
	fitPtsNum(isOnPeak) = fitPtsNum(isOnPeak)+1;
	for q = isOnPeak
		fitPts{q}(:,fitPtsNum(q)) = [X(p);Y(p)];
	end
end

% track the points on each line, find the start points and the end points,
line = [];
tempLine = struct;
for p = 1:peakNum
	t1 = [-cos(pthe(p)),sin(pthe(p))]; % the unit directional vector of the line
	dist1 = t1*fitPts{p}(:,1:fitPtsNum(p)); % dist along the line
    lines = houghlines(imge, theta, rho, PP, 'FillGap', 150, 'MinLength', 200);
	[ordDist, ordIdx] = sort(dist1,'ascend');
	ordPts = fitPts{p}(:,ordIdx);
    
    
	% handle with the gaps
	dist2 = diff(ordDist); % dist with each other
	gapPos = [0 find(dist2>maxGap) length(ordDist)];
	lineLen = diff(gapPos);
	for q = find(lineLen>=minLen)
		tempLine.theta = pthe(p);
		tempLine.rho = prho(p);
		tempLine.point1 = [M-ordPts(2,gapPos(q)+1),ordPts(1,gapPos(q)+1)+1];
		tempLine.point2 = [M-ordPts(2,gapPos(q+1)),ordPts(1,gapPos(q+1))+1];
		line = [line,tempLine];
		if length(line) == maxLineNum, break; end
	end
	if length(line) == maxLineNum, break; end
end
	
end

function [rows, cols] = findpeaks(map,minLen,maxPeakNum)
%	Find the at most maxLinNum points that's no less than minLen in map, meanwhile not
%	8-adjacent to each other, in MAP. Rows and cols are returned.

if max(max(map)) < minLen, return; end
rows = zeros(1,maxPeakNum);
cols = rows;
sz = size(map);
sup = ceil(sz/100);
for p = 1:maxPeakNum
	[V,I] = max(map(:));
	if V<minLen
		rows = rows(1:p-1);
		cols = cols(1:p-1);
		break;
	end
	[rows(p),cols(p)] = ind2sub(sz,I);
	
	% non-maximal suppression
	left = max(1,cols(p)-sup(2));
	lr = min(sup(2)*2+1,sz(2)-left);
	up = max(1,rows(p)-sup(1));
	ud = min(sup(1)*2+1,sz(1)-up);
	map(up:up+ud,left:left+lr) = 0;
end

end