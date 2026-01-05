%使用牛顿迭代法求解一元函数的零点
%
% 输入参数:
% - loss_fun  : 函数句柄, 表示待求解函数, y = loss_fun(x) 句柄输入输出均是标量
% - d_loss_fun: 函数句柄, loss_fun 对 x 的导数, dydx = d_loss_fun(x) 句柄输入输出均是标量
% - x_init    : double标量, 表示求解初值
% - iter_max  : double标量, 表示最大迭代次数
% - thre      : double标量, 迭代终止阈值
%
% 输出参数:
%   - x       : double标量, 求解结果
%   - err     : double标量, 求解结果的误差值
%   - is_found: double标量, 迭代标志
%               若迭代成功, 返回值为1; 
%               若迭代失败, 返回值为0; 
%               若f`(x)奇异返回值为-1;
function [x, err, is_found] = newtraph(loss_fun, d_loss_fun, x_init, iter_max, thre)
  x0 = x_init;
  x1 = 0;
  times = 0;
  
  for times=1:iter_max
    if abs(d_loss_fun(x0)) < 10.^-9
        is_found = -1;
        return;
    end
    x1 = x0-loss_fun(x0)/d_loss_fun(x0);
    if abs(x1-x0) < thre
        break;
    end
    x0 = x1;
  end
  if times == iter_max
    is_found = 0;
  else
    is_found = 1;
  end
   x = x1;
   err = abs(x1-x0);
  return;
end