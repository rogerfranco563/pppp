@extends('/layouts/layout')

@section('contenido')
<div class="container">
    <h1>Lista de empleados</h1>
    <div class="mensaje">*Mensaje*</div>
    <div class="line"></div>
    <table>
        <thead>
            <tr>
                <th>Cedula</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Cargo</th>
                <th>Horario</th>
                <th>Sueldo</th>
                <th>Fecha de ingreso</th>
                <th>Tipo de empleado</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Item 1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td><button class="pay-button">Pagar</button></td>
            </tr>
            <tr>
                <td>Item 1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td><button class="pay-button">Pagar</button></td>
            </tr>
            <tr>
                <td>Item 1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td><button class="pay-button">Pagar</button></td>
            </tr>
        </tbody>
    </table>
</div>
@endsection