load seamount
who -file seamount

disc = 8000;

D = @(a,b,c) b.^2 - 4*a*c;

%plot([a,b],'r.')

good_a = zeros(100,1);
good_b = zeros(100,1);
good_c = zeros(100,1);

all_a = zeros(100,1);
all_b = zeros(100,1);
all_c = zeros(100,1);

disc_bound_a = zeros(100,1);
disc_bound_b = zeros(100,1);
disc_bound_c = zeros(100,1);

i = 1;
j = 1;
k = 1;

for point_a = -500:500
    for point_b = -500:500
        for point_c = -500:500
        %irr BQF, have a nonsquare discriminant
        
        %Finding reduced forms
        %finding all reducible BQF
        if (abs(D(point_a,point_b,point_c)) < disc)&& (abs(point_b) <= point_a) && (point_a <= point_c) && (floor(sqrt(D(point_a,point_b,point_c)))==sqrt(D(point_a,point_b,point_c)))
            all_a(j) = point_a;
            all_b(j) = point_b;
            all_c(j) = point_c;
            j = j+1;
        end
        %Finding all irreducible BQF
        if (abs(D(point_a,point_b,point_c)) < disc) && (abs(point_b) <= point_a) && (point_a <= point_c)&& (floor(sqrt(D(point_a,point_b,point_c))) ~=sqrt(D(point_a,point_b,point_c)))                
                good_a(i) = point_a;
                good_b(i) = point_b;
                good_c(i) = point_c;
                i=i+1;
        end
        

%         %all forms
%         if (abs(D(point_a,point_b,point_c)) < disc) && (floor(sqrt(D(point_a,point_b,point_c)))==sqrt(D(point_a,point_b,point_c)))
%             all_a(j) = point_a;
%             all_b(j) = point_b;
%             all_c(j) = point_c;
%             j = j+1;
%         end
%         %Finding all irreducible BQF
%         if (abs(D(point_a,point_b,point_c)) < disc) && (floor(sqrt(D(point_a,point_b,point_c))) ~=sqrt(D(point_a,point_b,point_c)))                
%                 good_a(i) = point_a;
%                 good_b(i) = point_b;
%                 good_c(i) = point_c;
%                 i=i+1;
%         end
        if (abs(D(point_a,point_b,point_c)) == disc) && (abs(point_b) <= point_a) && (point_a <= point_c)               
            disc_bound_a(k) = point_a;
            disc_bound_b(k) = point_b;
            disc_bound_c(k) = point_c;
            k=k+1;
        end
        end

    end
end

good_a;
good_b;

%(10:10:end)
skip = 1;
skip_all = 1;

figure()
%Plotting of irreducible
scatter3(good_a(skip:skip:end),good_b(skip:skip:end),good_c(skip:skip:end),50,'b.')
hold on
%Plotting of reducible
scatter3(all_a(skip_all:skip_all:end),all_b(skip_all:skip_all:end),all_c(skip_all:skip_all:end),100,'gx')


legend('Irreducible forms','Reducible forms')
grid on
xlabel('a')
ylabel('b')
zlabel('c')
title(['All (reduced) quadratic forms of discriminant less than ',num2str(disc)])


figure()
scatter3(all_a(skip_all:skip_all:end),all_b(skip_all:skip_all:end),all_c(skip_all:skip_all:end),100,'gx')

figure()
scatter3(good_a(skip:skip:end),good_b(skip:skip:end),good_c(skip:skip:end),50,'b.')

%Discriminant bound
figure()
tri = delaunay(disc_bound_a(skip_all:skip_all:end),disc_bound_b(skip_all:skip_all:end));
h = trisurf(tri, disc_bound_a(skip_all:skip_all:end), disc_bound_b(skip_all:skip_all:end), disc_bound_c(skip_all:skip_all:end));
%axis vis3d



%Number of reducible
length(all_a);

%Number of irreducible
length(good_a);

length(good_a)/(length(good_a) + length(all_a))

