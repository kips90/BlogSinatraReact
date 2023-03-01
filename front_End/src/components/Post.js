import React from 'react'

function Post({post}) {
  return (
    <div>
        <div className="card mb-3">
            <div className="card-body">
                <h5 className="fw-bold">{post.title}</h5>
                <p className="card-text">{post.content}</p>
                <div className='d-flex flex-row'>
                    <p>By {post.user.username}</p>
                    <p className='px-3'> {post.created_at}</p>
                </div>
            </div>
            <hr/>
            <div className='p-4'>
                <h6>Comments {post.comments.length}</h6>
                {post.comments.map((singlecomment)=>(
                <p className='bg-light bordered mb-2'>{singlecomment.comment}</p>

                ))
                }

            </div>
        </div>
    </div>
  )
}

export default Post