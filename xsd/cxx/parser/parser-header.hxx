// file      : xsd/cxx/parser/parser-header.hxx
// copyright : Copyright (c) 2005-2014 Code Synthesis Tools CC
// license   : GNU GPL v2 + exceptions; see accompanying LICENSE file

#ifndef CXX_PARSER_PARSER_HEADER_HXX
#define CXX_PARSER_PARSER_HEADER_HXX

#include <cxx/parser/elements.hxx>

namespace CXX
{
  namespace Parser
  {
    void
    generate_parser_header (Context&, bool generate_xml_schema);
  }
}

#endif  // CXX_PARSER_PARSER_HEADER_HXX
