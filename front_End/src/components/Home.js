import React, { useEffect, useState } from 'react'
import Post from './Post'

function Home() {

    const [posts, setPost] = useState()
    const [loading, setLoading] = useState(true)

    useEffect(()=>{
        fetch("/posts", {
            method: "GET",
            headers: {
                Accept: "application/json"
            }
        })
        .then(r=>r.json())
        .then((response)=>{
            console.log(response)
            setPost(response)
        })

    }, [])

  return (
    <div>
        

        <div className="container ">
            <h1 className='py-3 '>Blogs {posts && posts.length}</h1>
            <div className="row ">
                <div className="col-sm-8">
                  {
                    posts && posts.map((post)=>(
                         <Post post={post} key={post.id} />
                    ))
                  }
                                        
                
                </div>

                <div className="col-sm-4">
                One of two columns
                </div>
            </div>
        </div>


    </div>
  )
}

export default Home