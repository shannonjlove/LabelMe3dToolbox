function k = getPartOfParents(annotation,i)
% Gets list of indices of parents for part.
%
% Inputs:
% annotation - LabelMe annotation structure
% i - Object index into annotation.object
%
% Outputs:
% k - Vector of indices into annotation.object. First element is parent
%     of part.  Last element is the top-most parent of part.

k = [];
if isfield(annotation.object(i),'world3d') && isfield(annotation.object(i).world3d,'parentid') && ~isempty(annotation.object(i).world3d.parentid)
  pp = annotation.object(i).world3d.parentid;
  k = ObjectID2Index(annotation,pp);
end

if ~isempty(k)
  k = [k getPartOfParents(annotation,k)];
end

return;
