#cloud-config
write_files:
  - path: /etc/ssh/banner
    content: |

      (                          
      )\ )        (            )  
      (()/(    )   )\ )      ( /( 
      /(_))( /(  (()/(  (   )\()) 
      (_))  )(_))  ((_)) )\ ((_)\  
      | _ \((_)_   _| | ((_)| |(_) 
      |  _// _` |/ _` |/ _ \| / / 
      |_|  \__,_|\__,_|\___/|_\_\ 

        _._     _,-'""`-._
      (,-.`._,'(       |\`-/|
          `-.-' \ )-`( , o o)
                `-    \`_`"'-

                                                      
runcmd:
  # Install banner
  - echo 'Banner /etc/ssh/banner' >> /etc/ssh/sshd_config.d/banner.conf
  - sudo systemctl restart sshd

  # Add a flag
  - echo 'Le flag est "Woman Power" ! Bravo à toi, tu as réussi à te connecter en SSH à ta VM !' >> /home/ubuntu/flag.txt
