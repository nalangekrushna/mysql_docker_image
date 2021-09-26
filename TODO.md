Next Steps.
1. use statefulset instead of deployment      done
2. use secrets for db password                done
3. run initialization script at start.        done
4. use pv and pvc for persistent storage      done
5. resolve "1045 Plugin caching_sha2_password could not be loaded" error.
    (quick fix done. find permanent solution.)  
6. deploy multiple db instances with one instance as primary write and other instances for reading purpose. (1 instance for writing 2 for read.)  later
7. refer to TODO list in website project and kubernetes branch.