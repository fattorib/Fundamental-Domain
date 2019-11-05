[a,b] = meshgrid(-50:50,-50:50);

disc = 1000;
c = 50;

D = @(a,b,c) b.^2 - 4*a*c;

%plot([a,b],'r.')

good_a = zeros(100);
good_b = zeros(100);

i = 1;
for point_a = -1000:1000
    for point_b = -1000:1000
        if (abs(D(point_a,point_b,c)) < disc) && (abs(point_b) <= point_a) && (point_a <= c)
                good_a(i) = point_a;
                good_b(i) = point_b;
                i=i+1;
        end
    end
end

good_a;
good_b;

plot(good_a,good_b,'r.')
grid on