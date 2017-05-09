#!/usr/bin/env python
import os, sys
import pika

message=sys.argv[1]
connection = pika.BlockingConnection(pika.ConnectionParameters('137.74.40.177'))
channel = connection.channel()
channel.queue_declare(queue='hello')
channel.basic_publish(exchange='',
                      routing_key='hello',
                      body=message)

print(" [x] Sent '"+ message +"'")
connection.close()

