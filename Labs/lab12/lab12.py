import re

def calculator_ops(calc_str):
    """
    Finds expressions from the Calculator language that have two
    numeric operands and returns the expression without the parentheses.

    >>> calculator_ops("(* 2 4)")
    ['* 2 4']
    >>> calculator_ops("(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))")
    ['* 2 4', '+ 3 5', '- 10 7']
    >>> calculator_ops("(* 2)")
    []
    """
    return re.findall(r'([-+*/] \d+ \d+)', calc_str)


#Q3: Linked List BNF

?start: link
link: "Link(" link_first ", "? link_rest? ")"

?link_first: NUMBER | link

?link_rest: NUMBER | link

%ignore /\s+/
%import common.NUMBER

#Q4: Tree BNF

?start: tree_node

tree_node: "Tree(" label ", "? branches? ")"
?label: NUMBER
branches: "[" tree_node (", " tree_node)* "]"

%ignore /\s+/
%import common.NUMBER