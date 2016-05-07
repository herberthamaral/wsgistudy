import uvloop
import asyncio
from aiosimpleserver import main

asyncio.set_event_loop_policy(uvloop.EventLoopPolicy())

if __name__ == '__main__':
    main()
