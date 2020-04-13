% This matlab script acts as a template for making cool animations that
% would help visualizing ideas 

clear; 
clc;
close all;

%% Generate data 
t = linspace(0, 2*pi,100);
x = 5 * cos(t);
y = 2 * sin(t);
z = t;

%% Draw/render scenario  
figh = figure;

for k = 1:length(t)
   % extract data 
   t_k = t(k);
   x_k = x(k);
   y_k = y(k);
   z_k = z(k);
   
   % Plot the current location of the particle
   plot3(x_k,y_k,z_k, 'go', 'LineWidth', 3, 'MarkerSize', 15);
   hold on
   
   % Plot the entire trajectory
   plot3(x,y,z, 'b-', 'LineWidth', 2);
   
   % Decorate the plot 
   grid on
   xlabel('x')
   ylabel('y')
   title(["Particle at t = " num2str(t_k) ' seconds'])
   view([45 35])
   % get frame generates a bitmap of all figures over time
   movieVector(k) = getframe(figh, [10 10 520 400]);
   
   % Pause will animate each frame as the loop progresses
   %pause(0.1)
   
end

%% Save the video
myWriter = VideoWriter('Traj_following', 'MPEG-4');
myWriter.FrameRate = 20;

open(myWriter);
writeVideo(myWriter, movieVector);
close(myWriter);