$.fn.selectDate = function(){
			var minYear = 1900
			var maxYear = (new Date).getFullYear()
			var yearSel = document.getElementById('year')
			var monthSel = document.getElementById('month')

			for(var y = maxYear;y >= minYear;y--){
				var yearOpt = document.createElement('option')
				yearOpt.value = y
				yearOpt.innerHTML = y+'年'
				yearSel.appendChild(yearOpt)
			}

			$("#year").click(function(event){
				if(!$("#year option:selected").val()) return;
				removeOption(monthSel)
				addOption(12,'月',monthSel)
				// removeOption(daySel)
			})

			$("#month").click(function(){
				var year = $("#year option:selected").val()
				var month = $("#month option:selected").val()

			})

			function addOption(num,unit,parent){
				//num：选项个数
				//unit：单位（年/月/日）
				//parent：父对象
				for(var index=1;index <= num;index++){
					var opt =document.createElement('option')
					$(opt).attr('value',index)
					if(index<10){index = '0'+index}
					$(opt).html(index+unit)
					$(parent).append(opt)
				}
			}
			
			function removeOption(parent){
				//parent：父对象
				var options = $(parent).find('option')
				for(var index = 1;index < options.length;index++){
					parent.removeChild(options[index])
				}
			}
		}