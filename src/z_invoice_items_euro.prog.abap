*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_invoice_items_euro.

class lcl_main definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO lcl_main.
        methods run.
  protected section.
  private section.

endclass.

class lcl_main implementation.

  method create.

    create object r_result.

  endmethod.

  method run.
    data: invoices type ref to zcl_invoice_retrieval.

    invoices = new zcl_invoice_retrieval( ).
    data(invoice_items) = invoices->get_items_from_db( ).

    cl_salv_table=>factory(
*      EXPORTING
      IMPORTING
        r_salv_table   = data(alv_table)    " Basis Class Simple ALV Tables
      CHANGING
        t_table        = invoice_items
    ).
*      CATCH cx_salv_msg.    "

    alv_table->display( ).

  endmethod.

endclass.

START-OF-SELECTION.
    lcl_main=>create( )->run( ).
