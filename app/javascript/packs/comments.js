 const createComment = () => {
    const form = document.querySelector('.form-container');
    const btn = document.getElementById('comment-btn');
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      form.classList.toggle('d-none');
    })
  }

  const displayComments = () => {
    const comments = document.getElementById('comments');
    const showComments = document.getElementById('all-comments');
    showComments.addEventListener('click', (event) => {
      event.preventDefault();
      comments.classList.toggle('d-none');
    })
  }
createComment();
displayComments();
