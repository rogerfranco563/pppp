@extends('/layouts/layout')

@section('titulo', 'pagos')

@section('contenido')
<div id="main" class="wrapper style1">
    <div class="container">
        <div class="major">
            <h2>Pago del Personal</h2>
            <p>*Mensaje*</p>
        </div>

        <!-- Lists -->
            <section>
                <h3> </h3>
                <div class="row">
                    <div class="col-6 col-12-xsmall">

                        <h4>Información personal</h4>
                        <ul class="alt">
                            <li>Cedula: </li>
                            <li>Nombre: </li>
                            <li>Apellido: </li>
                            <li>Cargo: </li>
                            <li>Horario: </li>
                            <li>Sueldo: </li>
                            <li>Fecha de ingreso: </li>
                            <li>Tipo de empleado: </li>
                        </ul>

                    </div>
                    <div class="col-6 col-12-xsmall">
                        
                <form method="post" action="#">
                    @crsf
                    <div class="row gtr-uniform gtr-50">
                            <div class="col-12">
                            <select name="category" id="category">
                                <option value="">- Quincena a pagar -</option>
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Octubre</option>
                                <option value="10">Septiembre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <input type="text" name="name" id="name" value="" placeholder="Bonificacion" />
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <input type="text" name="name" id="name" value="" placeholder="Deducciones" />
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <input type="text" name="name" id="name" value="" placeholder="Fecha de pago" />
                        </div>	
                        <br>
                        <li>Total de pago:</li>
                        <div class="col-12">
                            <ul class="actions">
                                <li><input type="submit" value="Enviar pago" class="primary" /></li>
                                <li><input type="reset" value="Reset" /></li>
                            </ul>
                        </div>		
                    
                    </div>
                </form>
                    </div>
                    </div>
@endsection