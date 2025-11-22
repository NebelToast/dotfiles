function set_blur


set CURRENT_BLUR (hyprctl getoption decoration:blur:size | grep "int:" | awk '{print $2}')
set BLUR_ENABLED (hyprctl getoption decoration:blur:enabled | grep "int:" | awk '{print $2}') 

if test "$argv[1]" = "+"
  
  if test "$BLUR_ENABLED" = "0"
    hyprctl keyword decoration:blur:enabled true
    hyprctl keyword decoration:blur:size 1
  else
    set NEW_BLUR (math $CURRENT_BLUR + 1)
    if test "$NEW_BLUR" -gt 4
       set NEW_BLUR 4
     end
    hyprctl keyword decoration:blur:size $NEW_BLUR
  end

else if test "$argv[1]" = "-"
  
  if test "$BLUR_ENABLED" = "1"
    
    if test "$CURRENT_BLUR" -gt "0"
      set NEW_BLUR (math $CURRENT_BLUR - 1)
      hyprctl keyword decoration:blur:size $NEW_BLUR
    else
      hyprctl keyword decoration:blur:enabled false
    end
  end
end
end