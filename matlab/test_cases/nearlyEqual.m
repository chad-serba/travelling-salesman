function bool = nearlyEqual(vec1, vec2)

 tol = 0.01;
 
 if all(vec1 - tol < vec2) && all(vec1 + tol > vec2)
     bool = true;
 else
     bool = false;
 end

end