const todoList = [];

function addtodo() {

   const task_input =  document.querySelector(".task_input");
   const task_input_value = task_input.value;
   todoList.push(task_input_value);
   console.log(todoList);
   task_input.value = '';
}