
function validarCurso()
        {
            
		if(document.getElementById('nome').value == '')
                {
                    alert('Preencha o campo Nome do Curso');
                    document.getElementById('nome').focus();
                    return false;
                 }else{
                     document.getElementById('FrmCurso').submit();
                    
                 }
                 
        }
        
function validarProfessor()
        {
            
		if(document.getElementById('nome').value == '')
                {
                    alert('Preencha o campo nome');
                    document.getElementById('nome').focus();
                    return false;
                 }
                 
		if(document.getElementById('email').value == '')
                {
                    alert('Preencha o campo Email');
                    document.getElementById('email').focus();
                    return false;
                 }
//		if(document.getElementById('rg').value == '')
//                {
//                    alert('Preencha o campo rg');
//                    document.getElementById('rg').focus();
//                    return false;
//                 }
//                 
//		if(document.getElementById('cpf').value == '')
//                {
//                    alert('Preencha o campo cpf');
//                    document.getElementById('cpf').focus();
//                    return false;
//                 }
//                 
//		if(document.getElementById('endereco').value == '')
//                {
//                    alert('Preencha o campo endereco');
//                    document.getElementById('endereco').focus();
//                    return false;
//                 }
//                 
		if(document.getElementById('telefone').value == '')
                {
                    alert('Preencha o campo telefone');
                    document.getElementById('telefone').focus();
                    return false;
                 }
                 
//		if(document.getElementById('datanasc').value == '')
//                {
//                    alert('Preencha o campo Data nascimento');
//                    document.getElementById('datanasc').focus();
//                    return false;
//                 }
//                 
//		if(document.getElementById('cargo').value == '')
//                {
//                    alert('Preencha o campo cargo');
//                    document.getElementById('cargo').focus();
//                    return false;
//                 }
//                 
//		if(document.getElementById('dataadmissao').value == '')
//                {
//                    alert('Preencha o campo Data de admissão');
//                    document.getElementById('dataadmissao').focus();
//                    return false;
//                 }
//
//
//		if(document.getElementById('salariohora').value == '')
//                {
//                    alert('Preencha o campo Salario hora');
//                    document.getElementById('salariohora').focus();
//                    return false;
//                 }
//
//		if(document.getElementById('cargo').value == '')
//                {
//                    alert('Preencha o campo cargo');
//                    document.getElementById('cargo').focus();
//                    return false;
//                 }
//
//		if(document.getElementById('horastrabalhadas').value == '')
//                {
//                    alert('Preencha o campo Hora Trabalhada');
//                    document.getElementById('horastrabalhadas').focus();
//                    return false;
//                 }
		if(document.getElementById('custohora').value == '')
                {
                    alert('Preencha o campo Custo Hora');
                    document.getElementById('custohora').focus();
                    return false;
                 }

		 

                document.getElementById('form1').submit();
        }