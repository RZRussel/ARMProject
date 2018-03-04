clear;

robot_description;

q_step = pi/4;
initial_size = 5000000;
singularities = zeros(initial_size, 4);
singularities_number = 0;

for q1=joint1.limit(1):q_step:joint1.limit(2)
  for q2=joint2.limit(1):q_step:joint2.limit(2)
    for q3=joint3.limit(1):q_step:joint3.limit(2)
      for q4=joint4.limit(1):q_step:joint4.limit(2)
        for q5=joint5.limit(1):q_step:joint5.limit(2)
          for q6=joint6.limit(1):q_step:joint6.limit(2)
              T = FK([q1 q2 q3 q4 q5 q6], robot);
              J = Jacobian([q1 q2 q3 q4 q5 q6], robot);
              s_index = 1/cond(J);
              singularities_number = singularities_number + 1;
              singularities(singularities_number, 1:3) = T(1:3, 4).';
              singularities(singularities_number, 4) = s_index;
          end
        end
      end
    end
  end    
end

actual_singularities = singularities(1:singularities_number, :);
scatter3(actual_singularities(:, 1), actual_singularities(:, 2), actual_singularities(:, 3), 5, actual_singularities(:, 4));
xlabel('X, mm');
ylabel('Y, mm');
zlabel('Z, mm');