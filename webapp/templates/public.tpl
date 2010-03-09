<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>ThinkTank Public Timeline</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="{$cfg->site_root_path}favicon.ico"/>

	<link type="text/css" href="{$cfg->site_root_path}cssjs/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
	<link type="text/css" href="{$cfg->site_root_path}cssjs/style.css" rel="stylesheet" />

</head>

<body>

{include file="_header.login.tpl" mode="public"}	

    <div class="thinktank-canvas round-all container_24">
        <div class="clearfix prepend_20">

            <div class="grid_22 push_1 clearfix">
    
                {if $tweet and ($replies OR $retweets) }
                
                    <div class="prepend_20">
                    <ul id="menu">
                        <!-- <li>Archived and Curated with <a href="http://thinktankapp.com">ThinkTank</a></li> -->
                        <li><a href="{$site_root}public.php">&larr; Back to the public timeline</a></li>
                    </ul>
                    </div>
                    
                    <div class="clearfix">
                        {if $retweets}<div class="grid_15 alpha">{else}<div class="grid_22">{/if}
                            <a href="http://twitter.com/{$tweet->author_username}/"><img src="{$tweet->author_avatar}" class="avatar2"></a>
                            <span class="tweet">{$tweet->tweet_html|link_usernames_to_twitter}</span>
                            <div class="small">(<a href="http://twitter.com/{$tweet->author_username}/">{$tweet->author_username}</a>, 
                            <a href="http://twitter.com/{$tweet->author_username}/status/{$tweet->status_id}/">{$tweet->pub_date|relative_datetime}</a>)</div>
                        </div>
                        {if $retweets}
                        <div class="grid_7 center big-number omega">
                            <div class="bl">
                            <div class="key-stat">
                                <h1>{$rtreach|number_format}</h1>
                                <h3>retweets to followers</h3>
                            </div>
                            </div>
                        </div>
                        {/if}
                    </div>
                    
                    {if $replies}
                        <div class="append_20 clearfix">               	
                    	{foreach from=$replies key=tid item=t name=foo}
                    		{include file="_status.public.tpl" t=$t}
                    	{/foreach}	
                    	</div>
                    {/if}                
                	{if $retweets}
                        <div class="append_20 clearfix">
                            <!--<h3 align="center">Retweets to {$rtreach|number_format} followers</h3>-->
                            {foreach from=$retweets key=tid item=t name=foo}
                                {include file="_status.public.tpl" t=$t}
                            {/foreach}	
                        </div>
                	{/if}
                
                    
                {else}                
                
                <div class="prepend_20">
                    <ul id="menu">
                        <li><a href="{$cfg->site_root_path}public.php">Latest</a></li> 
                        <li><a href="{$cfg->site_root_path}public.php?v=mostreplies">Most Replied-To</a></li> 
                        <li><a href="{$cfg->site_root_path}public.php?v=mostretweets">Most Retweeted</a></li> 
                        <li><a href="{$cfg->site_root_path}public.php?v=photos">Photos</a></li> 
                        <li><a href="{$cfg->site_root_path}public.php?v=links">Links</a></li>
                    </ul>
                </div>
                
                {/if}
                
                {if $header}<h1>{$header}</h1>{/if}
                {if $description}<h4>{$description}</h4>{/if}
                    
                {if $tweets}
                	{foreach from=$tweets key=tid item=t name=foo}
                		{include file="_status.public.tpl" t=$t}
                	{/foreach}
                {/if}

            </div>
            
        </div> <!-- #top -->
    </div> <!-- .thinktank-canvas -->

    <script type="text/javascript" src="{$cfg->site_root_path}cssjs/linkify.js"></script>
    
    <div id="footer" class="center prepend append clearfix">
        <p>Set up your own <a href="http://thinktankapp.com">ThinkTank</a>.<br />It is nice to be nice</p>
    </div>

</div> <!-- #content -->

</body>
</html>