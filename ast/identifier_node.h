// $Id: identifier_node.h,v 1.5 2016/04/13 19:50:50 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_AST_IDENTIFIER_H__
#define __ZU_AST_IDENTIFIER_H__

#include <ast/lvalue_node.h>
#include <string>

namespace zu {

  /**
   * Class for describing syntactic tree leaves for holding zu identifier
   * values.
   */
  class identifier_node: public zu::lvalue_node {
  public:
  	std::string *_name;	
  
    inline identifier_node(int lineno, std::string *name) :
        zu::lvalue_node(lineno), _name(name){
    }

	inline std::string *name(){
		return _name;
	}

    /**
     * @param sp semantic processor visitor
     * @param level syntactic tree level
     */
    void accept(basic_ast_visitor *sp, int level) {
      sp->do_identifier_node(this, level);
    }

  };

} // zu

#endif
