 const createComment = () => {
    const form = document.querySelector('.form-container');
    const btn = document.getElementById('comment-btn');
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      form.classList.remove('d-none');
      const submit = document.getElementById('comment-form')
      submit.addEventListener('submit', (event) => {
        const inputComment = document.getElementById('comment_content')
        if ( inputComment.value === "" ) {
        } else {
        form.classList.add('d-none');
        comments.classList.remove('d-none');
        }
      })
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
