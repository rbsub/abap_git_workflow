*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_invoice_items_euro2.

class lcl_main definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_main.

    METHODS run.

  protected section.
  private section.


endclass.

class lcl_main implementation.

method create.
    create OBJECT r_result.
ENDMETHOD.


METHOD run.
cl_salv_gui_table_ida=>create_for_cds_view( 'Z_INVOICE_ITEMS' )->fullscreen( )->display( ).
ENDMETHOD.

endclass.

START-OF-SELECTION.
    lcl_main=>create( )->run( ).
